from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# sets the name of your app to the name of your module ("app" if "app.py" is the name of your file)
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://laura@localhost:5432/example'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# db is an instance of SQLAlchemy Class
db = SQLAlchemy(app)

# create a new table in db


class Person(db.Model):
    __tablename__ = 'persons'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)

    def __repr__(self):
        return f'<Person ID:{self.id}, name: {self.name}>'


db.create_all()

# In this case, @app.route is a Python decorator. Decorators take functions and returns another function, usually extending the input function with additional ("decorated") functionality. @app.route is a decorator that takes an input function index() as the callback that gets invoked when a request to route / comes in from a client.
@app.route('/')
def index():
    person = Person.query.first()
    return f'Hello {person.name}'


# start flask in shell: FLASK_APP=flask-hello-app.py flask run
# or use the following alternative approach:
# if __name__ == '__main__':
#   app.run()
# When we call a script this way, using $ python script.py, the script's __name__ gets set to __main__ by the Python interpreter, which then runs through executing all code found in the script. When it reaches the end, and finds if __name__ == 'main', it evaluates this to True and therefore calls app.run() at the end, running the Flask app.
