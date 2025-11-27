from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db


horarios_bp = Blueprint("horarios", __name__, url_prefix="/horarios")


@horarios_bp.route("/")
def horarios():
    try:
        query_sql = text("select id_horario, turno, dia, h_inicio, h_fin from horario;")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [
            [
                r["id_horario"],
                r["turno"],
                r["dia"],
                str(r["h_inicio"]),
                str(r["h_fin"]),
            ]
            for r in result
        ]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []
    return render_template("horarios/index.html", data=datos_crudos)


@horarios_bp.route("/create", methods=["POST"])
def crear_horario():
    pass


@horarios_bp.route("/edit/<int:id>", methods=["POST"])
def editar_horario(id):
    pass


@horarios_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_horario(id):
    pass
