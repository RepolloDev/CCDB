from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db


servicios_bp = Blueprint("servicios", __name__, url_prefix="/servicios")


@servicios_bp.route("/")
def servicios():
    try:
        query_sql = text("SELECT * FROM servicios_publico")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("servicios/index.html", data=datos_crudos)


@servicios_bp.route("/create", methods=["POST"])
def crear_servicio():
    pass


@servicios_bp.route("/edit/<int:id>", methods=["POST"])
def editar_servicio(id):
    pass


@servicios_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_servicio(id):
    pass
