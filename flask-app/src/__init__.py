from flaskext.mysql import MySQL
from flask import Flask, jsonify, make_response

# create a MySQL object that we will use in other parts of the API
db = MySQL()


def create_app():
    app = Flask(__name__)

    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = open('/secrets/secret_key.txt').readline()

    # connect the DB object to MySQL.
    app.config['MYSQL_DATABASE_USER'] = 'webapp'
    app.config['MYSQL_DATABASE_PASSWORD'] = open('/secrets/db_password.txt').readline()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'vesti_db'

    # Initialize the database object with the settings above. 
    db.init_app(app)

    # Import the various routes
    from src.admins.admins import admins
    from src.advisors.advisors import advisors
    from src.clients.clients import clients

    # Register the routes that we just imported, so they can be properly handled
    app.register_blueprint(admins, url_prefix='/admins')
    app.register_blueprint(advisors, url_prefix='/advisors')
    app.register_blueprint(clients, url_prefix='/clients')

    return app


# helper method for queries
def get_help(query):
    cursor = db.get_db().cursor()
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


def update_help(query):
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

