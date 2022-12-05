from flask import Blueprint
from src import db, get_something


clients = Blueprint('clients', __name__)


# Get all customers from the db
@clients.route('/clients', methods=['GET'])
def get_customers():
    return get_something('select * from client')

@clients.route('/stocks', methods=['GET'])
def get_stocks():
    return get_something('select * from stock')
