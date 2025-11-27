from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

aportes_bp = Blueprint("aportes", __name__, url_prefix="/aportes")


@aportes_bp.route("/")
def index():
    datos = query_values(db, "select * from aportes_publico order by id_aporte")
    return render_template("aportes/index.html", data=datos)


@aportes_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        participantes = query_all(db, "select * from opt_participante_public")
        return render_template(
            "aportes/form.html", participantes=participantes, aporte=None
        )

    data = get_data()
    execute(
        db,
        "INSERT INTO aporte (monto_total, descripcion, id_participante) VALUES (:monto, :desc, :idp)",
        {
            "monto": data.get("monto_total"),
            "desc": data.get("descripcion"),
            "idp": data.get("id_participante"),
        },
    )
    return respond("Aporte creado", redirect_to=url_for("aportes.index"), status=201)


@aportes_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        aporte = query_one(db, "SELECT * FROM aporte WHERE id_aporte = :id", {"id": id})
        participantes = query_all(db, "select * from opt_participante_public")
        return render_template(
            "aportes/form.html", participantes=participantes, aporte=aporte
        )

    data = get_data()
    execute(
        db,
        "UPDATE aporte SET monto_total = :monto, descripcion = :desc, id_participante = :idp, f_edicion = now() WHERE id_aporte = :id",
        {
            "monto": data.get("monto_total"),
            "desc": data.get("descripcion"),
            "idp": data.get("id_participante"),
            "id": id,
        },
    )
    return respond("Aporte actualizado", redirect_to=url_for("aportes.index"))


@aportes_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        aporte = query_one(
            db, "SELECT * FROM aportes_publico WHERE id_aporte = :id", {"id": id}
        )
        return render_template("aportes/delete.html", aporte=aporte)

    execute(db, "DELETE FROM aporte WHERE id_aporte = :id", {"id": id})
    return respond("Aporte eliminado", redirect_to=url_for("aportes.index"))
