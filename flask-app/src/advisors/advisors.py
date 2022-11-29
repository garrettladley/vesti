from flask import Blueprint
from src import db, get_something


advisors = Blueprint('advisors', __name__)

# Get all the advisors from the db
@advisors.route('/advisors', methods=['GET'])
def get_advisors():
    return get_something('select * from advisor')
