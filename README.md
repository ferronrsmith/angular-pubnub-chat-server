DB Chat Control Center
==========================

server component for the angular pubnub chat application. Built with python


Configuration
-------------------------
```python
DEBUG = True
SECRET_KEY = ('\xa3\xb6\x15\xe3E\xc4\x8c\xbaT\x14\xd1:'
              '\xafc\x9c|.\xc0H\x8d\xf2\xe5\xbd\xd5')
```

> All configuration is contained within the app.cfg


DB Configuration
-------------------------
```python
# production configuration := uses mysql
# cloud-based db solution for application scaling & mobile endpoint support
if mode == 'prod':
    # production configuration := uses python-anywhere mysql configuration
    engine = create_engine('mysql+mysqldb://username:p@ssw0rd@mysql.server/username$default', convert_unicode=True)
elif mode == 'dev':
    # development configuration & benchmark := uses mysql
    engine = create_engine('mysql+mysqldb://root:p@ssw0rd@localhost/chat_app', convert_unicode=True)
else:
    # test configuration := uses sqlite
    engine = create_engine('sqlite:///chat.db', convert_unicode=True)
```

> The database.py file contains all db configuration settings. Currently the app supports 3 levels of configuration

> namely prod, dev & test. prod & dev uses mysql, while test uses sqlite db


