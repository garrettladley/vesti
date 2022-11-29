from flask import Blueprint
from src import db, get_something


admins = Blueprint('admins', __name__)


# Get all the admins from the db
@admins.route('/admins', methods=['GET'])
def get_admins():
    return get_something('select * from administrator')

