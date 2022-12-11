from flask import Blueprint, request
from src import get_something

clients = Blueprint('clients', __name__)

@clients.route('/client', methods=['POST'])
def get_client():
    current_client = request.form['clientID']
    return get_something(f'select name, value from portfolio where clientID = "{current_client}" limit 50')


@clients.route('/clients', methods=['GET'])
def get_clients():
    return get_something(
        'select clientID as value, CONCAT_WS(" ", `first_name`, `last_name`) AS label from client limit 50;')
