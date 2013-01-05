from flask import jsonify, request
from app import *
from extensions import requires_auth
from models import User
from flask.ext import admin, login, wtf
from utils import validateTemporarySession, GetCountryInfo, isAvailable, GetCityInfo, processQueueData, changeUserPassword

__author__ = 'ferron'


@app.route('/currentuser/<username>/<password>', methods=['GET'])
def login(username, password):
    if request.method == 'GET':
        if username is not None and password is not None:
            user = User.query.filter_by(username=username).first()
            if user is not None:
                if user.check_password(password):
                    return jsonify(success=True, uid=user.id, firstname=user.firstname, lastname=user.lastname,
                                   username=user.username, token=user.token, location=GetCountryInfo(request.remote_addr))
        return jsonify(success=False, cause="invalid username or password")


@app.route('/fieldcheck/<field>/<value>/<token>', methods=['GET'])
def fieldcheck(field, value, token):
    """
        Checks that fields are unique during the registration process.
        This function takes in a field and the value.
        All requests are validated with a temporary session token.
        The token must be unique for each request and cannot be reused
        within a 60 second cycle.
    """
    if validateTemporarySession(token):
        if request.method == 'GET':
            return jsonify(available=isAvailable(field=field, value=value), success=True)
        else:
            return jsonify(success=False, statusCode=401)
    else:
        return jsonify(success=False, statusCode=401, cause='session auth expired')


@app.route('/jsonip', methods=['GET'])
@requires_auth
def getip():
    """
        Returns the current IP information for a request made to this endpoint.
        Only authenticated users are currently allowed to access endpoint
        * Counter-measure for DOS attacks *
    """
    if request.method == 'GET':
        return jsonify(GetCountryInfo(ip=request.remote_addr))


@app.route('/jsoncity', methods=['GET'])
@requires_auth
def getcity():
    """
        Returns the current city information for a request made to this endpoint.
        Only authenticated users are currently allowed to access endpoint
        * Counter-measure for DOS attacks *
    """
    if request.method == 'GET':
        return jsonify(GetCityInfo(ip=request.remote_addr))


@app.route('/sendQueueData', methods=['POST'])
@requires_auth
def queueData():
    """
        Saves queue data to the database.
        Only authenticated users are currently allowed to access endpoint
    """
    if request.method == 'POST':
        return jsonify(processQueueData(request.data))

@app.route('/changepassword', methods=['POST'])
@requires_auth
def changePassword():
    if request.method == 'POST':
        return jsonify(changeUserPassword(request))