from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db


periodos_bp = Blueprint("periodos", __name__, url_prefix="/periodos")


@periodos_bp.route("/")
def periodos():
    try:
        query_sql = text("SELECT * FROM periodo")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("periodos/index.html", data=datos_crudos)


@periodos_bp.route("/create", methods=["POST"])
def crear_periodo():
    pass


@periodos_bp.route("/edit/<int:id>", methods=["POST"])
def editar_periodo(id):
    pass


@periodos_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_periodo(id):
    pass
