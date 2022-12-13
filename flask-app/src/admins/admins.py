from flask import Blueprint
from src import get_help


admins = Blueprint('admins', __name__)


@admins.route('/admins', methods=['GET'])
def get_admins():
    return get_help('select * from administrator')

