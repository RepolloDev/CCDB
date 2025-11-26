from dotenv import load_dotenv
import os
from urllib.parse import quote_plus
from flask_sqlalchemy import SQLAlchemy

load_dotenv()


class Database:
    # Objeto singleton de la base de datos
    # Una sola instancia de SQLAlchemy para toda la aplicación
    db = SQLAlchemy()

    """
    Extracción de las variables de entorno del
    archivo `.env` para la conexión a la base de datos
    """
    _db_user = os.getenv("DB_USER")
    _db_password = os.getenv("DB_PASSWORD")
    _db_host = os.getenv("DB_HOST")
    _db_port = os.getenv("DB_PORT")
    _db_name = os.getenv("DB_NAME")
    _db_password_quoted = quote_plus(_db_password)

    @classmethod
    def make_database_uri(cls):
        """
        Construye la URL de conexión a la base de datos
        utilizando las variables de entorno.
        """
        return f"postgresql://{cls._db_user}:{cls._db_password_quoted}@{cls._db_host}:{cls._db_port}/{cls._db_name}"

    @classmethod
    def init_app(cls, app):
        """
        Inicializa la extensión SQLAlchemy con la
        aplicación Flask para la base de datos y
        retorna la instancia de la base de datos.
        """
        app.config.setdefault("SQLALCHEMY_DATABASE_URI", cls.make_database_uri())
        app.config.setdefault("SQLALCHEMY_TRACK_MODIFICATIONS", False)
        cls.db.init_app(app)
        return cls.db
