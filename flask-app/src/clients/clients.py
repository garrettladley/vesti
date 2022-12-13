from flask import Blueprint, request, make_response, jsonify
from src import get_help, update_help
import yfinance as yf

clients = Blueprint('clients', __name__)


@clients.route('/client', methods=['POST'])
def get_client():
    current_client = request.form['clientID']
    value_updater(current_client)
    return get_help(f'select name as Name, value as Value from portfolio where clientID = "{current_client}" limit 50')


def value_updater(current_client):
    # get the current_client's portfolios
    portfolios = get_help(f'select portfolioID as ID from portfolio where clientID = "{current_client}"').get_json()
    # for each portfolio...
    for p in portfolios:
        # initially, set value of portfolio to 0
        current_value = 0
        # get the tickers and quantities in portfolio p
        stocks = get_help(f'select ticker, quantity from stock where portfolioID = "{p["ID"]}"').get_json()
        # for each stock...
        for s in stocks:
            price = yf.Ticker(s["ticker"]).info["regularMarketPrice"]
            # if price is none, set to 0. otherwise, cast to a float
            price = 0 if price is None else float(price)
            quantity = float(s["quantity"])
            current_value += price * quantity
        # update the value of current portfolio
        update_help(f'update portfolio set value = "{current_value}" where portfolioID = "{p["ID"]}"')


@clients.route('/clients', methods=['GET'])
def get_clients():
    return get_help(
        'select clientID as value, CONCAT_WS(" ", `first_name`, `last_name`) AS label from client limit 50;')
