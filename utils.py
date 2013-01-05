import requests
import simplejson as json
from werkzeug.contrib.cache import SimpleCache

# Utility Constants
from database import db_session
from models import Chat, User

APIKEY = '8709ea2be1b40299200e69df8ef3da0c86dd7a4bed1902da7e6d1b6c0e124021'
BASEURL = "http://api.ipinfodb.com/v3/"

cache = SimpleCache()


def GetGeoData(ip=None, flag='country'):
    """
        Queries ipinfodb rest service for ip location

        ip := ip address to be queried
        flag := determines the precision of the lookup
        Currently only two options are supported.

        country & city

        @see for more info : http://ipinfodb.com/ip_location_api_json.php

    """

    path = 'ip-country/'
    if ip == '127.0.0.1' or ip == 'localhost':  # development ip address
        ip = '190.213.112.135'

    if flag == 'city':
        path = 'ip-city/'

    baseurl = BASEURL + path
    payload = {'key': APIKEY, 'ip': ip, 'format': 'json'}
    result = requests.get(baseurl, params=payload)

    if result.status_code == requests.codes.ok:
        return json.loads(result.text)
    else:
        return None


def GetCountryInfo(ip):
    """
       Returns the location of an IP address (country, region, city, zipcode, latitude and longitude)
       and the associated timezone in JSON format.

       Use this for country precision lookup

        Sample return JSON Value
        {
          "countryName": "TRINIDAD AND TOBAGO",
          "ipAddress": "190.213.112.135",
          "statusMessage": "",
          "countryCode": "TT",
          "statusCode": "OK"
        }
    """
    return cacheObject(key=ip, obj=GetGeoData, flag='country')


def GetCityInfo(ip):
    """
       Returns the location of an IP address (country, region, city, zipcode, latitude and longitude)
       and the associated timezone in JSON format.

       Use this for city precision lookup

        Sample return JSON Value
        {
          "countryCode": "TT",
          "cityName": "PORT-OF-SPAIN",
          "zipCode": "-",
          "longitude": "-61.5166",
          "countryName": "TRINIDAD AND TOBAGO",
          "latitude": "10.6662",
          "timeZone": "-04:00",
          "regionName": "PORT-OF-SPAIN",
          "ipAddress": "190.213.112.135",
          "statusMessage": "",
          "statusCode": "OK"
        }
    """
    return cacheObject(key=ip, obj=GetGeoData, flag='city')


def cacheObject(key=None, obj=None, time=90 * 24 * 60 * 60, flag=''):
    """
        Generic function for caching information
        cache key : key + flag
        obj : object that needed to be cached
        time : log-time , default := 90 days
    """
    rv = cache.get(key + flag)
    if rv is None:
        rv = obj(key, flag)
        cache.set(key + flag, rv, timeout=time)
        print 'no cache'
    return rv


def isAvailable(field, value):
    """
        The following function checks if a username / email is available for use
        i.e :- a record does not exists in the database
    """
    result = 0
    if field == 'email':
        result = User.query.filter_by(email=value).count()
    elif field == 'username':
        result = User.query.filter_by(username=value).count()
    return result == 0


def processQueueData(data):
    """
        Method responsible for processing queue data
        The function takes a JSON array parses the events and saves data
        into the database
    """
    success = False
    reason = None
    print data

    try:
        jsonData = json.loads(data)
        sortedData = sorted(jsonData)
        for data in sortedData:
            record = json.loads(data['data'])
            eventType = data['event']
            if record is not None:
                if eventType == 'ChatLog':
                    print record
                    r = Chat(record['recieverId'], group_id=record['groupId'], senderId=record['senderId'],
                        message=record['message'])
                    db_session.add(r)
                    success = True
                else:
                    reason = "unsupported event type"
                    success = False
            else:
                reason = "error parsing record"
                success = False
        if success:
            db_session.commit()
        return dict(success=success, reason=reason)
    except:
        return dict(success=success, reason="error saving data")


def validateTemporarySession(auth):
    """
        Validates temporary session token
        A temporary session token is used for anonymous users who wish to make api calls
        For each request a unique token must be sent to the endpoint or else it will be seen as invalid
        Mask validation is done on the token to ensure the format is valid
            format :- xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
            Validations done := length validation, 1st mask, 3 mask & 5th mask validation
        The temporary token is placed in a cache for 60 seconds
    """
    token = auth.split('-')
    print auth
    if len(token) == 5:
        index = token[2]
        if len(auth) == 36 and \
           len(index) == 4 and \
           len(token[0]) == 8 and\
           len(token[4]) == 12 and\
           index.startswith('4'):
            print 'checking cache...'
            rv = cache.get(auth)
            if rv is None:
                cache.set(auth, auth, timeout=60)
                return True
    print 'invalid : token already used'
    return False


def changeUserPassword(request):
    """
        Method responsible for updating a user's password
    """
    success = False
    reason = None
    auth = request.headers.get('X-Auth-Header')
    user = User.query.filter_by(token=auth).first()
    stream = json.loads(request.data)

    if user.check_password(stream['opassword']):
        user.set_password(stream['npassword'])
        db_session.add(user)
        db_session.commit()
        success = True
    else :
        reason = 'invalid password supplied'

    return dict(success=success, reason=reason)