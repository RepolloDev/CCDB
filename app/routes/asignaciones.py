from ..db import Database
from ..utils import get_data, respond, query_all, query_values, execute, query_one
from flask import Blueprint, render_template, url_for, request

db = Database.db

asignaciones_bp = Blueprint("asignaciones", __name__, url_prefix="/asignaciones")


@asignaciones_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM asignaciones_publico ORDER BY id_vps")
    return render_template("asignaciones/index.html", data=datos)


@asignaciones_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        servicios = query_all(db, "SELECT * FROM servicios_publico")
        voluntarios = query_all(db, "SELECT * FROM voluntarios_publico")
        return render_template("asignaciones/form.html", servicios=servicios, voluntarios=voluntarios, asignacion=None)

    data = get_data()
    execute(db, "INSERT INTO voluntario_participa_servicio (id_servicio, id_voluntario) VALUES (:id_servicio, :id_voluntario)", {
        "id_servicio": data.get("id_servicio"),
        "id_voluntario": data.get("id_voluntario"),
    })
    return respond("Asignación creada", redirect_to=url_for("asignaciones.index"), status=201)


@asignaciones_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        asignacion = query_one(db, "SELECT * FROM voluntario_participa_servicio WHERE id_vps = :id", {"id": id})
        servicios = query_all(db, "SELECT * FROM servicios_publico")
        voluntarios = query_all(db, "SELECT * FROM voluntarios_publico")
        return render_template("asignaciones/form.html", servicios=servicios, voluntarios=voluntarios, asignacion=asignacion)

    data = get_data()
    execute(db, "UPDATE voluntario_participa_servicio SET id_servicio = :id_servicio, id_voluntario = :id_voluntario WHERE id_vps = :id", {
        "id_servicio": data.get("id_servicio"),
        "id_voluntario": data.get("id_voluntario"),
        "id": id,
    })
    return respond("Asignación actualizada", redirect_to=url_for("asignaciones.index"))


@asignaciones_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        asignacion = query_one(db, "SELECT * FROM asignaciones_publico WHERE id_vps = :id", {"id": id})
        return render_template("asignaciones/delete.html", asignacion=asignacion)

    execute(db, "DELETE FROM voluntario_participa_servicio WHERE id_vps = :id", {"id": id})
    return respond("Asignación eliminada", redirect_to=url_for("asignaciones.index"))
