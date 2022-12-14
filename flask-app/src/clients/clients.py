from datetime import datetime

from flask import Blueprint, request, make_response, jsonify
from src import get_help, portf_update, yf_price, update_help

clients = Blueprint('clients', __name__)


# generate clientID : first and last name value label pairings
# used to create a dropdown that will allow the user to impersonate a client
@clients.route('/clis', methods=['GET'])
def get_clients():
    return get_help('select c.clientID as "value", '
                    'concat_ws(" ", c.first_name, c.last_name) as "label" '
                    'from client c '
                    'limit 50;')


# POST request to allow for the impersonation of a client
# GET request returns the name and value of all of this client's portfolios
@clients.route('/portfs', methods=['POST', 'GET'])
def post_get_portfs():
    current_client = request.form['clientID']
    portf_update(f'select p.portfolioID as "ID" '
                 f'from portfolio p '
                 f'where p.clientID = "{current_client}";')

    json_data = [get_help(f'select p.name as "Name", '
                          f'p.value as "Value" '
                          f'from portfolio p '
                          f'where p.clientID = "{current_client}" '
                          f'order by "Value" '
                          f'limit 50;').get_json(),
                 get_help(f'select concat_ws(" ", adv.first_name, adv.last_name) as "Advisor Name", '
                          f'adv.email as "Email" '
                          f'from client c join advisor adv on c.advisorID = adv.advisorID '
                          f'where c.clientID = "{current_client}";').get_json(),
                 get_help(f'select concat_ws(" ", adm.first_name, adm.last_name) as "Administrator Name", '
                          f'adm.email as "Email" '
                          f'from client c join advisor adv on c.advisorID = adv.advisorID '
                          f'join admin_advisor aa  on adv.advisorID = aa.advisorID '
                          f'join administrator adm on aa.adminID = adm.adminID '
                          f'where c.clientID = "{current_client}";').get_json()
                 ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# POST request to allow for the impersonation of a client
# based on the selected client, update the associated portfolio values
# GET request returns 3 things:
# 1. a portfolioID : name value label pairing to create a dropdown that will allow the user to select one of the
# impersonated client's portfolios
# 2. the name and email of their advisor
# 3. the names and emails of the administrators that oversee this client's advisor
@clients.route('/sel_cli', methods=['POST', 'GET'])
def post_get_select_client():
    current_client = request.form['clientID']
    portf_update(f'select p.portfolioID as "ID" '
                 f'from portfolio p '
                 f'where p.clientID = "{current_client}";')
    json_data = [get_help(f'select p.portfolioID as "value", '
                          f'p.name as "label" '
                          f'from portfolio p '
                          f'where p.clientID = "{current_client}" '
                          f'limit 50;').get_json(),
                 get_help(f'select concat_ws(" ", adv.first_name, adv.last_name) as "Advisor Name", '
                          f'adv.email as "Email" '
                          f'from client c join advisor adv on c.advisorID = adv.advisorID '
                          f'where c.clientID = "{current_client}";').get_json(),
                 get_help(f'select concat_ws(" ", adm.first_name, adm.last_name) as "Administrator Name", '
                          f'adm.email as "Email" '
                          f'from client c join advisor adv on c.advisorID = adv.advisorID '
                          f'join admin_advisor aa  on adv.advisorID = aa.advisorID '
                          f'join administrator adm on aa.adminID = adm.adminID '
                          f'where c.clientID = "{current_client}";').get_json()
                 ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# POST request to allow for the selection of a portfolio from the impersonated client
# based on the selected client, update the associated portfolio values
# GET request returns information about the largest holding in this portfolio
@clients.route('/sel_cli_portf', methods=['POST', 'GET'])
def post_get_client_portfolio():
    current_portfolio = request.form['portfolioID']
    portf_update(f'select p.portfolioID as "ID" '
                 f'from portfolio p '
                 f'where p.portfolioID = "{current_portfolio}";')
    largest_position = get_help(f'select s.ticker as "Ticker", '
                                f's.quantity as "Quantity" '
                                f'from stock s '
                                f'where s.portfolioID = "{current_portfolio}" '
                                f'order by s.quantity '
                                f'limit 1;').get_json()
    json_data = []
    for x in largest_position:
        json_data.append(x["Ticker"])
        json_data.append(x["Quantity"])
        json_data.append(f'${yf_price(x["Ticker"])}')
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# POST request to allow for a trade to occur based on this portfolio and a given quantity
@clients.route('/trade', methods=['POST'])
def post_get_trade():
    current_portfolio = request.form['portfolioID']
    quantity = request.form['quantity']
    largest_position = get_help(f'select s.ticker as "Ticker", '
                                f's.quantity as "Quantity",'
                                f's.date_bought as "Date Bought" '
                                f'from stock s '
                                f'where s.portfolioID = "{current_portfolio}" '
                                f'order by s.quantity '
                                f'limit 1;').get_json()
    info = []
    for x in largest_position:
        info.append(x["Ticker"])
        info.append(x["Date Bought"])
        info.append(x["Quantity"])
        info.append(yf_price(x["Ticker"]))
    new_quantity = max(float(info[2]) + float(quantity), 0)
    if new_quantity != info[2]:
        mysql_datetime = datetime.strptime(info[1], "%a, %d %b %Y %H:%M:%S GMT").strftime(
            "%Y-%m-%d %H:%M:%S")
        update_help(f'update stock s '
                    f'set s.quantity = "{new_quantity}" '
                    f'where s.portfolioID = "{current_portfolio}" and '
                    f's.ticker = "{info[0]}" and '
                    f's.date_bought = "{mysql_datetime}" and '
                    f's.quantity = "{info[2]}";')
    the_response = make_response()
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
