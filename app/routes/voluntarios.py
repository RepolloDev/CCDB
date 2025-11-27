from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request
from sqlalchemy import text

db = Database.db

voluntarios_bp = Blueprint("voluntarios", __name__, url_prefix="/voluntarios")


@voluntarios_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM voluntarios_publico")
    total = fnTotalVoluntarios()
    menores = fnTotalMenores()
    return render_template(
        "voluntarios/index.html",
        data=datos,
        total_voluntarios=total,
        total_menores=menores
    )

@voluntarios_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        niveles = query_all(db, "SELECT * FROM nivel_educacion ORDER BY tipo")
        return render_template("voluntarios/form.html", niveles=niveles, voluntario=None)

    data = get_data()

    id_nvl_edu = data.get("id_nvl_edu") or None

    voluntario_id = execute(db, """
        SELECT fnCrearVoluntario(
            :nombre, :paterno, :materno, :ci, :celular, :genero, :fn,
            :zona, :calle, :nro, :correo, :niv
        )
    """, {
        "nombre": data.get("nombre"),
        "paterno": data.get("paterno"),
        "materno": data.get("materno"),
        "ci": data.get("ci"),
        "celular": data.get("celular"),
        "genero": data.get("genero"),
        "fn": data.get("fecha_nacimiento"),
        "zona": data.get("zona"),
        "calle": data.get("barrio"),
        "nro": data.get("nro_casa"),
        "correo": data.get("correo", ""),
        "niv": id_nvl_edu
    })

    return respond("Voluntario creado", redirect_to=url_for("voluntarios.index"), status=201)



@voluntarios_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        voluntario = query_one(db, """
            SELECT v.id_voluntario, p.ci, p.nombre, p.paterno, p.materno, p.celular, p.genero, p.f_nacimiento, p.zona, p.calle, p.nro,
                   v.correo, v.id_nvl_edu
            FROM voluntario v
            JOIN persona p ON p.id_persona = v.id_persona
            WHERE v.id_voluntario = :id
        """, {"id": id})
        niveles = query_all(db, "SELECT * FROM nivel_educacion ORDER BY tipo")
        return render_template("voluntarios/form.html", niveles=niveles, voluntario=voluntario)

    data = get_data()
    id_nvl_edu = data.get("id_nvl_edu") or None

    result = query_one(db, "SELECT id_persona FROM voluntario WHERE id_voluntario = :id", {"id": id})

    execute(db, """
        UPDATE persona
        SET nombre = :nombre, paterno = :paterno, materno = :materno,
            celular = :celular, genero = :genero, f_nacimiento = :fn,
            zona = :zona, calle = :calle, nro = :nro, f_edicion = now()
        WHERE id_persona = :idp
    """, {
        "nombre": data.get("nombre"),
        "paterno": data.get("paterno"),
        "materno": data.get("materno", ""),
        "celular": data.get("celular", ""),
        "genero": data.get("genero", ""),
        "fn": data.get("fecha_nacimiento"),
        "zona": data.get("zona", ""),
        "calle": data.get("barrio", ""),
        "nro": data.get("nro_casa", ""),
        "idp": result["id_persona"]
    })

    execute(db, "UPDATE voluntario SET correo = :correo, id_nvl_edu = :niv WHERE id_voluntario = :id", {
        "correo": data.get("correo", ""),
        "niv": id_nvl_edu,
        "id": id
    })

    return respond("Voluntario actualizado", redirect_to=url_for("voluntarios.index"))


@voluntarios_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        voluntario = query_one(db, "SELECT * FROM voluntarios_publico WHERE id_voluntario = :id", {"id": id})
        return render_template("voluntarios/delete.html", voluntario=voluntario)

    execute(db, "DELETE FROM voluntario WHERE id_voluntario = :id", {"id": id})
    return respond("Voluntario eliminado", redirect_to=url_for("voluntarios.index"))


def fnTotalVoluntarios():
    return db.session.execute(text("SELECT COUNT(*) FROM voluntario")).scalar()


def fnTotalMenores():
    sql = """
        SELECT COUNT(*)
        FROM voluntario v
        JOIN persona pe ON pe.id_persona = v.id_persona
        WHERE DATE_PART('year', AGE(pe.f_nacimiento)) < 18
    """
    return db.session.execute(text(sql)).scalar()
