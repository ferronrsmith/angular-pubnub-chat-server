__author__ = 'ferron'

from flask.ext.admin.contrib import sqlamodel
from flask.ext import admin

# Create customized index view class
class MyAdminIndexView(admin.AdminIndexView):
    @admin.expose('/')
    def index(self):
        return self.render('index.html')