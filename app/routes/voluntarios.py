from ..db import Database

from flask import Blueprint, render_template, request
from sqlalchemy import text

db = Database.db

voluntarios_bp = Blueprint("voluntarios", __name__, url_prefix="/voluntarios")


@voluntarios_bp.route("/")
def voluntarios():
    try:
        query_sql = text("SELECT * FROM voluntarios_publico")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("voluntarios/index.html", data=datos_crudos)
