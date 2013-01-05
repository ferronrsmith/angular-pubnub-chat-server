"""
    Contains all error handling code
"""

from flask import request, Response
from flask.helpers import json
from app import *

__author__ = 'ferron'


@app.errorhandler(401)
def unauthorized_access(error):
    return Response(response=json.dumps(dict(error='Unauthorized Access',
                                             statusCode=error.code)),
                    status=error.code, headers={},
                    mimetype='application/json', content_type='application/json')


@app.errorhandler(404)
def page_not_found(error):
    return Response(response=json.dumps(dict(error='404 Page Not Found',
                                             statusCode=error.code)),
                    status=error.code, headers={},
                    mimetype='application/json', content_type='application/json')


@app.errorhandler(405)
def method_not_allowed(error):
    return Response(response=json.dumps(dict(error='405 Method Not Allowed',
                                      message='The method {0} is not allowed for the requested URL'.format(request.method),
                                      statusCode=error.code)),
             status=error.code, headers={},
             mimetype='application/json', content_type='application/json')