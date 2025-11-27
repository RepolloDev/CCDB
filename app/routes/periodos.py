from ..db import Database
from ..utils import get_data, respond, query_one, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

periodos_bp = Blueprint("periodos", __name__, url_prefix="/periodos")


@periodos_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM periodos_publico")
    return render_template("periodos/index.html", data=datos)


@periodos_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        return render_template("periodos/form.html", periodo=None)

    data = get_data()
    execute(db, "INSERT INTO periodo (f_inicio, f_fin) VALUES (:f_inicio, :f_fin)", {
        "f_inicio": data.get("f_inicio"),
        "f_fin": data.get("f_fin"),
    })
    return respond("Periodo creado", redirect_to=url_for("periodos.index"), status=201)


@periodos_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        periodo = query_one(db, "SELECT * FROM periodo WHERE id_periodo = :id", {"id": id})
        return render_template("periodos/form.html", periodo=periodo)

    data = get_data()
    execute(db, "UPDATE periodo SET f_inicio = :f_inicio, f_fin = :f_fin, f_edicion = now() WHERE id_periodo = :id", {
        "f_inicio": data.get("f_inicio"),
        "f_fin": data.get("f_fin"),
        "id": id,
    })
    return respond("Periodo actualizado", redirect_to=url_for("periodos.index"))


@periodos_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        periodo = query_one(db, "SELECT * FROM periodos_publico WHERE id_periodo = :id", {"id": id})
        return render_template("periodos/delete.html", periodo=periodo)

    execute(db, "DELETE FROM periodo WHERE id_periodo = :id", {"id": id})
    return respond("Periodo eliminado", redirect_to=url_for("periodos.index"))
