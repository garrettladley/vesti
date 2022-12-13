from flask import Blueprint, request, make_response, jsonify
from src import get_help, portfolio_sum

admins = Blueprint('admins', __name__)


@admins.route('/adms', methods=['GET'])
def get_admins():
    return get_help('select adm.adminID as "value", '
                    'concat_ws(" ", adm.first_name, adm.last_name) as "label" '
                    'from administrator adm '
                    'limit 50;')


@admins.route('/taum', methods=['POST', 'GET'])
def post_get_taum():
    current_admin = request.form['adminID']
    json_data = [calc_taum(current_admin),
                 get_help(f'select c.email as "Email" '
                          f'from client c join advisor adv join admin_advisor aa '
                          f'where aa.adminID = "{current_admin}";').get_json(),
                 get_help(f'select a.email as "Email" '
                          f'from advisor av join admin_advisor aa '
                          f'where aa.adminID = "{current_admin}";').get_json()
                 ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# JIT
def calc_taum(current_admin):
    admin_oversees = get_help(f'select aa.advisorID as "ID" '
                              f'from admin_advisor aa '
                              f'where aa.adminID = "{current_admin}";').get_json()
    taum = 0
    for adv in admin_oversees:
        clients = get_help(f'select c.clientID as "ID" '
                           f'from client c '
                           f'where advisorID = "{adv["ID"]}";').get_json()
        for cli in clients:
            portfolios = get_help(f'select p.portfolioID as "ID" '
                                  f'from portfolio p'
                                  f'where [.clientID = "{cli["ID"]}";').get_json()
            for p in portfolios:
                taum += portfolio_sum(p)
    return f'${round(taum,3)}'
