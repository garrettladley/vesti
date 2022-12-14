from flask import Blueprint, request, make_response, jsonify
from src import get_help, portf_update

clients = Blueprint('clients', __name__)


# generate clientID : first and last name value label pairings
# used to create a dropdown that will allow the user to impersonate a client
@clients.route('/clis', methods=['GET'])
def get_clients():
    return get_help('select c.clientID as "value", '
                    'concat_ws(" ", c.first_name, c.last_name) as "label" '
                    'from client '
                    'limit 50;')


# POST request to allow for the impersonation of a client
# GET request returns the name and value of all of this client's portfolios
@clients.route('/portfs', methods=['POST', 'GET'])
def post_get_portfs():
    current_client = request.form['clientID']
    portf_update(f'select p.portfolioID as "ID" '
                 f'from portfolio p '
                 f'where p.clientID = "{current_client}";')
    the_response = get_help(f'select p.name as "Name", '
                            f'p.value as "Value" '
                            f'from p.portfolio '
                            f'where p.clientID = "{current_client}" '
                            f'order by "Value" '
                            f'limit 50;')
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
@clients.route('/sel_cli', methods=['POST, GET'])
def post_get_select_client():
    current_client = request.form['clientID']
    portf_update(f'select p.portfolioID as "ID" '
                 f'from portfolio p '
                 f'where p.clientID = "{current_client}";')
    json_data = [
        get_help('select p.portfolioID as "value", '
                 'p.name as "label" '
                 'from portfolio p '
                 'limit 50;').get_json(),
        get_help(f'select concat_ws(" ", adv.first_name, adv.last_name) as "Advisor Name", '
                 f'adv.email as "Email" '
                 f'from client c join advisor adv '
                 f'where c.clientID = "{current_client}";').get_json(),
        get_help(f'select concat_ws(" ", adm.first_name, adm.last_name) as "Administrator Name", '
                 f'adm.email as "Email" '
                 f'from client c join advisor adv join admin_advisor aa join administrator adm '
                 f'where c.clientID = "{current_client}";').get_json()
    ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# POST request to allow for the selection of a portfolio from the impersonated client
# based on the selected client, update the associated portfolio values
# GET request returns the most valuable stock in this portfolio
@clients.route('/sel_cli_portf', methods=['POST, GET'])
def post_get_client_portfolio():
    current_portfolio = request.form['portfolioID']
    portf_update(f'select p.portfolioID as "ID" '
                 f'from portfolio p '
                 f'where p.portfolioID = "{current_portfolio}";',
                 stock_update=True)
    the_response = get_help(f'select s.ticker as "Ticker", '
                            f's.value as "Value" '
                            f'from stock s '
                            f'where s.portfolioID = "{current_portfolio}" '
                            f'order by s.value '
                            f'limit 1;')
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
