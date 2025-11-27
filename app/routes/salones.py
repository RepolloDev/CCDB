from ..db import Database
from ..utils import get_data, respond, query_one, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

salones_bp = Blueprint("salones", __name__, url_prefix="/salones")


@salones_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM salones_publico")
    return render_template("salones/index.html", data=datos)


@salones_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        return render_template("salones/form.html", salon=None)

    data = get_data()
    execute(db, "INSERT INTO salon (nombre, piso, capacidad) VALUES (:nombre, :piso, :capacidad)", {
        "nombre": data.get("nombre"),
        "piso": data.get("piso", 0),
        "capacidad": data.get("capacidad", 0),
    })
    return respond("Salón creado", redirect_to=url_for("salones.index"), status=201)


@salones_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        salon = query_one(db, "SELECT * FROM salon WHERE id_salon = :id", {"id": id})
        return render_template("salones/form.html", salon=salon)

    data = get_data()
    execute(db, "UPDATE salon SET nombre = :nombre, piso = :piso, capacidad = :capacidad, f_edicion = now() WHERE id_salon = :id", {
        "nombre": data.get("nombre"),
        "piso": data.get("piso", 0),
        "capacidad": data.get("capacidad", 0),
        "id": id,
    })
    return respond("Salón actualizado", redirect_to=url_for("salones.index"))


@salones_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        salon = query_one(db, "SELECT * FROM salones_publico WHERE id_salon = :id", {"id": id})
        return render_template("salones/delete.html", salon=salon)

    execute(db, "DELETE FROM salon WHERE id_salon = :id", {"id": id})
    return respond("Salón eliminado", redirect_to=url_for("salones.index"))
