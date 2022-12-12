from flask import Blueprint
from src import get_something


advisors = Blueprint('advisors', __name__)


@advisors.route('/advisors', methods=['GET'])
def get_advisors():
    return get_something('select * from advisor')
