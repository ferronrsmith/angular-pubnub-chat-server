"""
    The Authorization module controls security for the Endpoints
    X-Auth-Header must contain a user's unique token for the request
    to be valid and passed to the necessary function
"""

from flask import request
from models import User, Admin

__author__ = 'ferron'


def auth_user():
    # check if token belongs to a valid user
    return verifyUser(isAdmin=False)


def admin_user():
    # check if user is an admin
    return verifyUser(isAdmin=True)


def verifyUser(isAdmin=False):
    """
        Retrieves the X-Auth-Header from the request object
        A check is done to determine if the user exists.
        isAdmin :- flag to perform admin validation

        X-Auth-Header is a custom authorization header used for
        validating user request.
        Check := http://en.wikipedia.org/wiki/List_of_HTTP_header_fields
        for more information on headers
    """
    auth = request.headers.get('X-Auth-Header')
    if auth is not None:
        user = User.query.filter_by(token=auth).first()
        if user is not None and isAdmin:
            admin = Admin.query.filter_by(user_id=user.id).first()
            return admin is not None
        return user is not None and isAdmin is False
    return False