from flask import Blueprint, request, make_response, jsonify
from src import get_help, portf_update

advisors = Blueprint('advisors', __name__)


# generate adminID : first and last name value label pairings
# used to create a dropdown that will allow the user to impersonate an advisor
@advisors.route('/advs', methods=['GET'])
def get_admins():
    return get_help('select adv.advisorID as "value", '
                    'concat_ws(" ", adv.first_name, adv.last_name) as "label" '
                    'from advisor adv '
                    'limit 50;')


# POST request to allow for the impersonation of an advisor
# based on the selected advisor, update the associated portfolio values
# GET request returns 3 things:
# 1. based on the selected advisor, return the following for each of the clients they advise
# first and last name
# portfolio name
# portfolio value
# 2. the emails of all the clients that this advisor oversees
# 3. the emails of all the administrators that oversee this advisor
@advisors.route('/portfs', methods=['POST', 'GET'])
def post_get_portfs():
    current_advisor = request.form['advisorID']
    portf_update(f'select p.portfolioID as "ID" '
                          f'from advisor a join client c join portfolio p '
                          f'where c.advisorID = "{current_advisor}";')
    # use dict instead of list?
    json_data = [get_help(f'select concat_ws(" ", c.first_name, c.last_name) as "Client Name", '
                          f'p.name as "Portfolio Name", '
                          f'p.value as "Value" '
                          f'from portfolio p join client c join advisor a '
                          f'where a.advisorID = "{current_advisor}" '
                          f'order by "Client Name" '
                          f'limit 50;').get_json(),
                 get_help(f'select concat_ws(" ", c.first_name, c.last_name) as "Client Name", '
                          f'c.email as "Email" '
                          f'from client c join advisor a '
                          f'where a.advisorID = "{current_advisor}";').get_json(),
                 get_help(f'select concat_ws(" ", adm.first_name, adm.last_name) as "Administrator Name", '
                          f'adm.email as "Email" '
                          f'from admin_advisor aa join administrator adm '
                          f'where aa.advisorID = "{current_advisor}";').get_json()
                 ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
