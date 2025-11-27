from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db


salones_bp = Blueprint("salones", __name__, url_prefix="/salones")


@salones_bp.route("/")
def salones():
    try:
        query_sql = text("select id_salon, nombre, piso, capacidad from salon")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []
    return render_template("salones/index.html", data=datos_crudos)


@salones_bp.route("/create", methods=["POST"])
def crear_salon():
    pass


@salones_bp.route("/edit/<int:id>", methods=["POST"])
def editar_salon(id):
    pass


@salones_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_salon(id):
    pass
