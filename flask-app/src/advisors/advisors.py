from flask import Blueprint, request, make_response, jsonify
from src import get_help, yf_price, update_help


advisors = Blueprint('advisors', __name__)


@advisors.route('/advs', methods=['GET'])
def get_admins():
    return get_help(
        'select advisorID as value, CONCAT_WS(" ", `first_name`, `last_name`) AS label from advisor limit 50;')


@advisors.route('/portfs', methods=['POST', 'GET'])
def post_get_portfs():
    current_advisor = request.form['advisorID']
    value_updater(current_advisor)
    json_data = [get_help(
        f'select CONCAT_WS(" ", c.first_name, c.last_name) as "Client Name", p.name as "Portfolio Name", p.value as Value from portfolio p join client c join advisor a where a.advisorID = "{current_advisor}" order by Value limit 50').get_json(),
        get_help(f'select CONCAT_WS(" ", c.first_name, c.last_name) as "Client Name", c.email as Email from client c join advisor a where a.advisorID = "{current_advisor}"').get_json(),
        get_help(f'select CONCAT_WS(" ", adm.first_name, adm.last_name) as "Administrator Name", adm.email as Email from admin_advisor aa join administrator adm where aa.advisorID = "{current_advisor}"').get_json()
    ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# JIT
def value_updater(current_advisor):
    # get the current_client's portfolios
    portfolios = get_help(f'select p.portfolioID as ID from advisor a join client c join portfolio p where c.advisorID = "{current_advisor}"').get_json()
    # for each portfolio...
    for p in portfolios:
        # initially, set value of portfolio to 0
        current_value = 0
        # get the tickers and quantities in portfolio p
        stocks = get_help(f'select ticker, quantity from stock where portfolioID = "{p["ID"]}"').get_json()
        # for each stock...
        for s in stocks:
            price = yf_price(s["ticker"])
            # if price is none, set to 0. otherwise, cast to a float
            price = 0 if price is None else float(price)
            quantity = float(s["quantity"])
            current_value += price * quantity
        # update the value of current portfolio
        update_help(f'update portfolio set value = "{current_value}" where portfolioID = "{p["ID"]}"')
