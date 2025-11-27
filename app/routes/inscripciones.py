from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

inscripciones_bp = Blueprint("inscripciones", __name__, url_prefix="/inscripciones")


@inscripciones_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM inscripciones_publico ORDER BY id_psct")
    return render_template("inscripciones/index.html", data=datos)


@inscripciones_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        cursos = query_all(db, "SELECT * FROM cursos_talleres_select")
        participantes = query_all(db, "SELECT * FROM opt_participante_public")
        return render_template("inscripciones/form.html", cursos=cursos, participantes=participantes, inscripcion=None)

    data = get_data()
    execute(db, "INSERT INTO participante_seregistra_curso_taller (id_curtal, id_participante) VALUES (:id_curtal, :id_participante)", {
        "id_curtal": data.get("id_curtal"),
        "id_participante": data.get("id_participante"),
    })
    return respond("Inscripción creada", redirect_to=url_for("inscripciones.index"), status=201)


@inscripciones_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        inscripcion = query_one(db, "SELECT * FROM participante_seregistra_curso_taller WHERE id_psct = :id", {"id": id})
        cursos = query_all(db, "SELECT * FROM cursos_talleres_select")
        participantes = query_all(db, "SELECT * FROM opt_participante_public")
        return render_template("inscripciones/form.html", cursos=cursos, participantes=participantes, inscripcion=inscripcion)

    data = get_data()
    execute(db, "UPDATE participante_seregistra_curso_taller SET id_curtal = :id_curtal, id_participante = :id_participante WHERE id_psct = :id", {
        "id_curtal": data.get("id_curtal"),
        "id_participante": data.get("id_participante"),
        "id": id,
    })
    return respond("Inscripción actualizada", redirect_to=url_for("inscripciones.index"))


@inscripciones_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        inscripcion = query_one(db, "SELECT * FROM inscripciones_publico WHERE id_psct = :id", {"id": id})
        return render_template("inscripciones/delete.html", inscripcion=inscripcion)

    execute(db, "DELETE FROM participante_seregistra_curso_taller WHERE id_psct = :id", {"id": id})
    return respond("Inscripción eliminada", redirect_to=url_for("inscripciones.index"))
