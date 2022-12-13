from flask import Blueprint, request
from src import get_help

clients = Blueprint('clients', __name__)


@clients.route('/clis', methods=['GET'])
def get_clients():
    return get_help(
        'select c.clientID as "value", '
        'concat_ws(" ", c.first_name, c.last_name) as "label" '
        'from client '
        'limit 50;')


@clients.route('/portfs', methods=['POST', 'GET'])
def post_get_portfs():
    current_client = request.form['clientID']
    update_value(f'select p.portfolioID as "ID" '
                          f'from portfolio p '
                          f'where p.clientID = "{current_client}";')
    the_response = get_help(f'select p.name as "Name", '
                            f'p.value as "Value" '
                            f'from p.portfolio '
                            f'where p.clientID = "{current_client}" '
                            f'limit 50;')
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
