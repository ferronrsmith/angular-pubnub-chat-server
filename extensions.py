"""
 Contains extensions methods for the application to perform
 repetitive task easily.
"""

from flask.helpers import json
from auth import auth_user

__author__ = 'ferron'


from functools import wraps
from flask import Response


def authenticate():
    """Sends a 401 response that enables basic auth"""
    return Response(response=json.dumps(dict(success=False, statusCode=401,
                                             cause='Could not verify your access level for Endpoint')),
                    status=401, headers={'X-Auth-Header': 'Token Required'},
                    mimetype='application/json', content_type='application/json')


def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if not auth_user():
            return authenticate()
        return f(*args, **kwargs)
    return decorated