from flask import Blueprint, make_response, request, jsonify
from src import get_help, yf_price


admins = Blueprint('admins', __name__)


@admins.route('/adms', methods=['GET'])
def get_admins():
    return get_help(
        'select adminID as value, CONCAT_WS(" ", `first_name`, `last_name`) AS label from administrator limit 50;')


@admins.route('/taum', methods=['POST', 'GET'])
def post_get_taum():
    current_admin = request.form['adminID']
    json_data = [calc_taum(current_admin),
                 get_help(
                     f'select c.email as Email from client c join advisor a join admin_advisor aa where aa.adminID = "{current_admin}"').get_json(),
                 get_help(
                     f'select a.email as Email from advisor a join admin_advisor aa where aa.adminID = "{current_admin}"').get_json()
                 ]
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# JIT
def calc_taum(current_admin):
    admin_oversees = get_help(f'select advisorID as ID from admin_advisor where adminID = "{current_admin}"').get_json()
    taum = 0
    for adv in admin_oversees:
        clients = get_help(f'select clientID as ID from client where advisorID = "{adv["ID"]}"').get_json()
        for cli in clients:
            portfolios = get_help(f'select portfolioID as ID from portfolio where clientID = "{cli["ID"]}"').get_json()
            for p in portfolios:
                stocks = get_help(f'select ticker, quantity from stock where portfolioID = "{p["ID"]}"').get_json()
                for s in stocks:
                    price = yf_price(s["ticker"])
                    # if price is none, set to 0. otherwise, cast to a float
                    price = 0 if price is None else float(price)
                    quantity = float(s["quantity"])
                    taum += price * quantity
    return f'${round(taum,3)}'
