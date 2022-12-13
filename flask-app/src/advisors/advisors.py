from flask import Blueprint, request, make_response, jsonify
from src import get_help, portf_updater

advisors = Blueprint('advisors', __name__)


@advisors.route('/advs', methods=['GET'])
def get_admins():
    return get_help('select adv.advisorID as "value", '
                    'concat_ws(" ", adv.first_name, adv.last_name) as "label" '
                    'from advisor adv '
                    'limit 50;')


@advisors.route('/portfs', methods=['POST', 'GET'])
def post_get_portfs():
    current_advisor = request.form['advisorID']
    portf_updater(f'select p.portfolioID as "ID" '
                          f'from advisor a join client c join portfolio p '
                          f'where c.advisorID = "{current_advisor}";')
    json_data = [get_help(f'select concat_ws(" ", c.first_name, c.last_name) as "Client Name", '
                          f'p.name as "Portfolio Name", '
                          f'p.value as Value '
                          f'from portfolio p join client c join advisor a '
                          f'where a.advisorID = "{current_advisor}" '
                          f'order by p.value '
                          f'limit 50;').get_json(),
                 get_help(f'select concat_ws(" ", c.first_name, c.last_name) as "Client Name", '
                          f'c.email as Email '
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

