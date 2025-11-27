from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db

inscripciones_bp = Blueprint("inscripciones", __name__, url_prefix="/inscripciones")

# RELACION ENTRE PARTICIPANTE Y CURSO-TALLER

@inscripciones_bp.route("/")
def inscripciones():
    try:
        query_sql = text("SELECT * FROM inscripciones_publico")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("inscripciones/index.html", data=datos_crudos)


@inscripciones_bp.route("/create", methods=["POST"])
def crear_inscripcion():
    pass


@inscripciones_bp.route("/edit/<int:id>", methods=["POST"])
def editar_inscripcion(id):
    pass


@inscripciones_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_inscripcion(id):
    pass
