from functools import cache

import yfinance as yf
from flask import Flask, jsonify, make_response
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()


def create_app():
    app = Flask(__name__)

    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = open('/secrets/secret_key.txt').readline()

    # connect the DB object to MySQL.
    app.config['MYSQL_DATABASE_USER'] = 'webapp'
    app.config['MYSQL_DATABASE_PASSWORD'] = open('/secrets/db_password.txt').readline()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'vesti_db'

    # Initialize the database object with the settings above. 
    db.init_app(app)

    # Import the various routes
    from src.admins.admins import admins
    from src.advisors.advisors import advisors
    from src.clients.clients import clients

    # Register the routes that we just imported, so they can be properly handled
    app.register_blueprint(admins, url_prefix='/adm')
    app.register_blueprint(advisors, url_prefix='/adv')
    app.register_blueprint(clients, url_prefix='/cli')

    return app


# helper method for select queries
def get_help(query):
    cursor = db.get_db().cursor()
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# cached helper method for calls to the Yahoo Finance API to determine the price of the stock identified by the given
# ticker
@cache
def yf_price(ticker):
    return yf.Ticker(ticker).info["regularMarketPrice"]


# returns the sum of the value of all the stocks within the given portfolio
def portfolio_sum(p):
    # initially, set value of portfolio to 0
    total = 0
    # get the tickers and quantities in portfolio p
    stocks = get_help(f'select s.ticker as "ticker", '
                      f's.quantity as "quantity" '
                      f'from stock s '
                      f'where s.portfolioID = "{p["ID"]}";').get_json()
    # for each stock...
    for s in stocks:
        price = yf_price(s["ticker"])
        # if price is none, set to 0. otherwise, cast to a float
        price = 0.0000 if price is None else float(price)
        quantity = float(s["quantity"])
        total += price * quantity
    return total


# helper method for update queries
def update_help(query):
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()


# updates the portfolios given by the portfolio query
def portf_update(portfolio_query):
    # get the current_client's portfolios
    portfolios = get_help(portfolio_query).get_json()
    # for each portfolio...
    for p in portfolios:
        # update the value of current portfolio
        update_help(f'update portfolio p '
                    f'set p.value = "{portfolio_sum(p)}" '
                    f'where p.portfolioID = "{p["ID"]}";')
