import os
import psycopg2

# Configuración de la conexión a la base de datos
db_host = os.getenv("POSTGRES_HOST", "localhost")
db_name = os.getenv("POSTGRES_DB", "store")
db_user = os.getenv("POSTGRES_USER", "usuario")
db_password = os.getenv("POSTGRES_PASSWORD", "adbd2425")

def get_db_connection():
    conn = psycopg2.connect(
        host=db_host,
        database=db_name,
        user=db_user,
        password=db_password
    )
    return conn
