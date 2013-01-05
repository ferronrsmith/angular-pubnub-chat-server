from flask import Flask
from app import *
from auth import *
from api import *
from models import *
from endpoints import *
from error_handlers import *


# most WSGI servers start here
if __name__ == '__main__':
    app.run(debug=True)