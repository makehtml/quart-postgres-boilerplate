from databases import Database
from quart import current_app
from sqlalchemy import MetaData

metadata = MetaData()


async def db_connection():
    database_url = f"postgresql://{current_app.config['DB_USERNAME']}:{current_app.config['DB_PASSWORD']}@{current_app.config['DB_HOST']}:5432/{current_app.config['DB_NAME']}"
    database = Database(database_url, min_size=5, max_size=20)

    return database
