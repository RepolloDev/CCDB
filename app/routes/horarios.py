from ..db import Database
from ..utils import get_data, respond, query_one, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

horarios_bp = Blueprint("horarios", __name__, url_prefix="/horarios")


@horarios_bp.route("/")
def index():
    datos = query_values(db, "SELECT id_horario, turno, dia, to_char(h_inicio, 'HH24:MI') as h_inicio, to_char(h_fin, 'HH24:MI') as h_fin FROM horario ORDER BY id_horario")
    return render_template("horarios/index.html", data=datos)


@horarios_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        return render_template("horarios/form.html", horario=None)

    data = get_data()
    execute(db, "INSERT INTO horario (turno, dia, h_inicio, h_fin) VALUES (:turno, :dia, :h_inicio, :h_fin)", {
        "turno": data.get("turno"),
        "dia": data.get("dia"),
        "h_inicio": data.get("h_inicio"),
        "h_fin": data.get("h_fin"),
    })
    return respond("Horario creado", redirect_to=url_for("horarios.index"), status=201)


@horarios_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        horario = query_one(db, "SELECT id_horario, turno, dia, to_char(h_inicio, 'HH24:MI') as h_inicio, to_char(h_fin, 'HH24:MI') as h_fin FROM horario WHERE id_horario = :id", {"id": id})
        return render_template("horarios/form.html", horario=horario)

    data = get_data()
    execute(db, "UPDATE horario SET turno = :turno, dia = :dia, h_inicio = :h_inicio, h_fin = :h_fin, f_edicion = now() WHERE id_horario = :id", {
        "turno": data.get("turno"),
        "dia": data.get("dia"),
        "h_inicio": data.get("h_inicio"),
        "h_fin": data.get("h_fin"),
        "id": id,
    })
    return respond("Horario actualizado", redirect_to=url_for("horarios.index"))


@horarios_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        horario = query_one(db, "SELECT id_horario, turno, dia, to_char(h_inicio, 'HH24:MI') as h_inicio, to_char(h_fin, 'HH24:MI') as h_fin FROM horario WHERE id_horario = :id", {"id": id})
        return render_template("horarios/delete.html", horario=horario)

    execute(db, "DELETE FROM horario WHERE id_horario = :id", {"id": id})
    return respond("Horario eliminado", redirect_to=url_for("horarios.index"))
