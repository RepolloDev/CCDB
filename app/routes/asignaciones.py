from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db


asignaciones_bp = Blueprint("asignaciones", __name__, url_prefix="/asignaciones")


@asignaciones_bp.route("/")
def asignaciones():
    try:
        query_sql = text("SELECT * FROM asignaciones_publico")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("asignaciones/index.html", data=datos_crudos)


@asignaciones_bp.route("/create", methods=["POST"])
def crear_asignacion():
    pass


@asignaciones_bp.route("/edit/<int:id>", methods=["POST"])
def editar_asignacion(id):
    pass


@asignaciones_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_asignacion(id):
    pass
