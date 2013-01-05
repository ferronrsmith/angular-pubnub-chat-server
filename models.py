import hashlib
import uuid
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from sqlalchemy.orm import relationship, backref
from database import Base
from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash


class User(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True, autoincrement=True)
    username = Column(String(50), unique=True)
    password = Column(String(50), unique=False)
    firstname = Column(String(50), unique=False)
    lastname = Column(String(50), unique=False)
    cellPhone = Column(String(50), unique=False, default="")
    email = Column(String(50), unique=True)
    picture = Column(String(100), unique=False)
    gender = Column(String(50), unique=False)
    token = Column(String(50), unique=True)
    datecreated = Column(DateTime, unique=False)
    lastupdated = Column(DateTime, unique=False)
    group = relationship('UserGroup', backref=backref("user", lazy="joined"))
    status = relationship('StatusMsg', backref=backref("user", lazy="joined"))

    def __init__(self, username=None, password=None,
                 firstname=None, lastname=None, cellPhone=None, email=None, gender=None,
                 datecreated=None, lastupdated=None):
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        if cellPhone is not None:
            self.cellPhone = cellPhone
        self.email = email
        if gender is not None:
            self.gender = gender
        self.picture = self.create_gravatar(email)
        self.set_password(password)

        if datecreated is None:
            self.datecreated = datetime.utcnow()
        if lastupdated is None:
            self.lastupdated = datetime.utcnow()
        self.token = str(uuid.uuid1())

    def set_password(self, password):
        self.password = generate_password_hash(password, method="sha1", salt_length=8)

    def check_password(self, password):
        return check_password_hash(self.password, password)

    def create_gravatar(self, email):
        return self.gravatar_url(size=160, email=email)

    def gravatar_url(self, email=None, size=80):
        """
        Create a gravatar image URL using a users email.
        An HASH is replaced with the calculated hash for the specific email address you are requesting.
        For example, here is my base URL: http://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50
        """
        return 'http://www.gravatar.com/avatar/%s?d=identicon&s=%d' %\
               (hashlib.md5(email.strip().lower().encode('utf-8')).hexdigest(), size)

        # Flask-Login integration
    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return self.id

    # Required for administrative interface
    def __unicode__(self):
        return self.username


class Group(Base):
    __tablename__ = 'group_info'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), unique=True)


class StatusMsg(Base):
    __tablename__ = 'status_msg'
    id = Column(Integer, primary_key=True, autoincrement=True)
    message = Column(String(500), unique=True)
    user_id = Column(Integer, ForeignKey('user.id'))


class Admin(Base):
    __tablename__ = 'admin'
    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.id'))


class UserGroup(Base):
    __tablename__ = 'user_group'
    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.id'))
    group_id = Column(Integer, ForeignKey('group_info.id'))


class Chat(Base):
    __tablename__ = 'chat'
    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.id'))
    group_id = Column(Integer, ForeignKey('group_info.id'))
    senderId = Column(Integer, ForeignKey('user.id'))
    message = Column(Text, unique=False)
    datecreated = Column(DateTime, unique=False)
    lastupdated = Column(DateTime, unique=False)

    def __init__(self, user_id=None, group_id=None, senderId=None, message=None, datecreated=None, lastupdated=None):
        self.user_id = user_id
        self.senderId = senderId
        self.group_id = group_id
        self.message = message
        if datecreated is None:
            self.datecreated = datetime.utcnow()
        if lastupdated is None:
            self.lastupdated = datetime.utcnow()