from flask import Blueprint, request, make_response, jsonify
from src import get_help, portfolio_sum

admins = Blueprint('admins', __name__)


# generate adminID : first and last name value label pairings
# used to create a dropdown that will allow the user to impersonate an administrator
@admins.route('/adms', methods=['GET'])
def get_admins():
    return get_help('select adm.adminID as "value", '
                    'concat_ws(" ", adm.first_name, adm.last_name) as "label" '
                    'from administrator adm '
                    'limit 50;')


# POST request to allow for the impersonation of an administrator
# GET request returns 3 things:
# 1. based on the selected administrator, calculate the total assets under (their) management
# go through all the advisors this administrator oversees,
# all the Cli those advisors advise,
# all the portfolios those clients have
# all the stocks within those portfolios
# sum the value
# 2. the emails of all the clients that this administrator oversees
# 3. the emails of all the advisors that this administrator oversees
@admins.route('/taum', methods=['POST', 'GET'])
def post_get_taum():
    current_admin = request.form['adminID']
    # use dict instead of list?
    json_data = [calc_taum(current_admin),
                 get_help(f'select c.email as "Email" '
                          f'from client c join advisor adv on c.advisorID = adv.advisorID '
                          f'join admin_advisor aa on adv.advisorID = aa.advisorID '
                          f'where aa.adminID = "{current_admin}";').get_json(),
                 get_help(f'select adv.email as "Email" '
                          f'from advisor adv join admin_advisor aa '
                          f'where aa.adminID = "{current_admin}";').get_json()
                 ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# calculate the total assets under management of the administrator identified by the given adminID
def calc_taum(current_admin):
    # get all the advisorIDs
    admin_oversees = get_help(f'select aa.advisorID as "ID" '
                              f'from admin_advisor aa '
                              f'where aa.adminID = "{current_admin}";').get_json()
    # initially, set TotalAssetsUnderManagement to 0
    taum = 0
    # for each advisor...
    for adv in admin_oversees:
        # get all the clientIDs
        clients = get_help(f'select c.clientID as "ID" '
                           f'from client c '
                           f'where c.advisorID = "{adv["ID"]}";').get_json()
        # for each client...
        for cli in clients:
            # get all the portfolioIDs
            portfolios = get_help(f'select p.portfolioID as "ID" '
                                  f'from portfolio p '
                                  f'where p.clientID = "{cli["ID"]}";').get_json()
            # for each portfolio...
            for p in portfolios:
                # call to helper
                taum += portfolio_sum(p)
    # format and round
    return f'${round(taum,3)}'
