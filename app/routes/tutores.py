from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db

tutores_bp = Blueprint("tutores", __name__, url_prefix="/tutores")


@tutores_bp.route("/")
def tutores():
    try:
        query_sql = text("SELECT * FROM tutores_select")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("tutores/index.html", data=datos_crudos)
