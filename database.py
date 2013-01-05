"""
 Database configuration and SQL-Alchemy Set-up
"""

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm.session import sessionmaker

mode = 'test'  # can be test / dev /prod

# production configuration := uses mysql
# cloud-based db solution for application scaling & mobile endpoint support
if mode == 'prod':
    # production configuration := uses python-anywhere mysql configuration
    engine = create_engine('mysql+mysqldb://ferronrsmith:p@ssw0rd@mysql.server/ferronrsmith$default', convert_unicode=True)
elif mode == 'dev':
    # development configuration & benchmark := uses mysql
    engine = create_engine('mysql+mysqldb://root:p@ssw0rd@localhost/chat_app', convert_unicode=True)
else:
    # test configuration := uses sqlite
    engine = create_engine('sqlite:///chat.db', convert_unicode=True)


db_session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

Base = declarative_base()
Base.query = db_session.query_property()


def init_db():
    import models
    Base.metadata.create_all(bind=engine)

