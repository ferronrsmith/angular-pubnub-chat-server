#imports
from flask import Flask
import flask.ext.sqlalchemy
import flask.ext.restless
import flask
from database import db_session
from flask.ext import admin, wtf
from models import *
from views import *
from flask.ext.admin.contrib import sqlamodel


__author__ = 'ferron'

app = Flask(__name__)
app.config.from_pyfile('app.cfg')

db = flask.ext.sqlalchemy.SQLAlchemy(app)
manager = flask.ext.restless.APIManager(app, session=db_session)
admin = admin.Admin(app, 'DB Chat Admin Dashboard', index_view=MyAdminIndexView())
admin.add_view(sqlamodel.ModelView(User, db.session))
admin.add_view(sqlamodel.ModelView(Group, db.session))
admin.add_view(sqlamodel.ModelView(StatusMsg, db.session))
# admin.add_view(sqlamodel.ModelView(Admin, db.session))
admin.add_view(sqlamodel.ModelView(UserGroup, db.session))
admin.add_view(sqlamodel.ModelView(Chat, db.session))

