from app import *
from auth import auth_user, admin_user
from models import User, Group, Chat, UserGroup

__author__ = 'ferron'

excludes = ['password', 'datecreated', 'lastupdated', 'token']
prefix = '/api/v1'

manager.create_api(User, methods=['GET', 'POST'], url_prefix=prefix, exclude_columns=excludes,
                   results_per_page=20, authentication_required_for=['GET'], authentication_function=auth_user)

manager.create_api(Group, methods=['GET', 'POST'], url_prefix=prefix, exclude_columns=excludes,
                   authentication_required_for=['GET', 'POST'], authentication_function=auth_user)

manager.create_api(Chat, methods=['GET'], url_prefix=prefix,
                   authentication_required_for=['GET'], authentication_function=auth_user)

manager.create_api(UserGroup, methods=['GET', 'POST'], url_prefix=prefix, exclude_columns=excludes,
                   authentication_required_for=['GET', 'POST'], authentication_function=admin_user)