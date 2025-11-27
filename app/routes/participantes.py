from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request
from sqlalchemy import text

db = Database.db

participantes_bp = Blueprint("participantes", __name__, url_prefix="/participantes")


@participantes_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM participantes_publico")

    total = fnTotalParticipantes()
    activos = fnTotalActivos()
    menores = fnTotalMenores()

    return render_template(
        "participantes/index.html",
        data=datos,
        total_participantes=total,
        total_activos=activos,
        total_menores=menores
    )


@participantes_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        tutores = query_all(db, "SELECT * FROM tutores_publico")
        return render_template("participantes/form.html", tutores=tutores, participante=None)

    data = get_data()
    
    # Normalizar id_tutor (convertir string vacío a None)
    id_tutor = data.get("id_tutor")
    if id_tutor == "" or id_tutor is None:
        id_tutor = None
    
    # Buscar o crear persona
    try:
        persona = query_one(db, "SELECT id_persona FROM persona WHERE ci = :ci", {"ci": data.get("ci")})
        execute(db, "UPDATE persona SET nombre = :nombre, paterno = :paterno, materno = :materno, celular = :celular, genero = :genero, f_nacimiento = :fn, zona = :zona, calle = :calle, nro = :nro, f_edicion = now() WHERE id_persona = :idp", {
            "nombre": data.get("nombre"),
            "paterno": data.get("paterno"),
            "materno": data.get("materno", ""),
            "celular": data.get("celular", ""),
            "genero": data.get("genero", ""),
            "fn": data.get("fecha_nacimiento"),
            "zona": data.get("zona", ""),
            "calle": data.get("barrio", ""),
            "nro": data.get("nro_casa", ""),
            "idp": persona["id_persona"],
        })
        id_persona = persona["id_persona"]
    except:
        id_persona = execute(db, "INSERT INTO persona (nombre, paterno, materno, ci, celular, genero, f_nacimiento, zona, calle, nro) VALUES (:nombre, :paterno, :materno, :ci, :celular, :genero, :fn, :zona, :calle, :nro) RETURNING id_persona", {
            "nombre": data.get("nombre"),
            "paterno": data.get("paterno"),
            "materno": data.get("materno", ""),
            "ci": data.get("ci"),
            "celular": data.get("celular", ""),
            "genero": data.get("genero", ""),
            "fn": data.get("fecha_nacimiento"),
            "zona": data.get("zona", ""),
            "calle": data.get("barrio", ""),
            "nro": data.get("nro_casa", ""),
        })

    # Verificar si ya existe participante
    try:
        existing = query_one(db, "SELECT id_participante FROM participante WHERE id_persona = :idp", {"idp": id_persona})
        # Si existe, actualizar en vez de crear
        execute(db, "UPDATE participante SET estado = :estado, id_tutor = :idt WHERE id_participante = :id", {
            "estado": data.get("estado", "activo"),
            "idt": id_tutor,
            "id": existing["id_participante"],
        })
    except:
        # Crear participante
        execute(db, "INSERT INTO participante (id_persona, estado, id_tutor) VALUES (:idp, :estado, :idt)", {
            "idp": id_persona,
            "estado": data.get("estado", "activo"),
            "idt": id_tutor,
        })
    
    return respond("Participante creado", redirect_to=url_for("participantes.index"), status=201)


@participantes_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        participante = query_one(db, "SELECT p.id_participante, p.id_persona, pe.ci, pe.nombre, pe.paterno, pe.materno, pe.celular, pe.genero, pe.f_nacimiento, pe.zona, pe.calle, pe.nro, p.estado, p.id_tutor FROM participante p JOIN persona pe ON pe.id_persona = p.id_persona WHERE p.id_participante = :id", {"id": id})
        tutores = query_all(db, "SELECT * FROM tutores_publico")
        return render_template("participantes/form.html", tutores=tutores, participante=participante)

    data = get_data()
    
    # Normalizar id_tutor (convertir string vacío a None)
    id_tutor = data.get("id_tutor")
    if id_tutor == "" or id_tutor is None:
        id_tutor = None
    
    # Obtener id_persona del participante
    result = query_one(db, "SELECT id_persona FROM participante WHERE id_participante = :id", {"id": id})
    
    # Actualizar persona
    execute(db, "UPDATE persona SET nombre = :nombre, paterno = :paterno, materno = :materno, celular = :celular, genero = :genero, f_nacimiento = :fn, zona = :zona, calle = :calle, nro = :nro, f_edicion = now() WHERE id_persona = :idp", {
        "nombre": data.get("nombre"),
        "paterno": data.get("paterno"),
        "materno": data.get("materno", ""),
        "celular": data.get("celular", ""),
        "genero": data.get("genero", ""),
        "fn": data.get("fecha_nacimiento"),
        "zona": data.get("zona", ""),
        "calle": data.get("barrio", ""),
        "nro": data.get("nro_casa", ""),
        "idp": result["id_persona"],
    })
    
    # Actualizar participante
    execute(db, "UPDATE participante SET estado = :estado, id_tutor = :idt WHERE id_participante = :id", {
        "estado": data.get("estado", "activo"),
        "idt": id_tutor,
        "id": id,
    })
    
    return respond("Participante actualizado", redirect_to=url_for("participantes.index"))


@participantes_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        participante = query_one(db, "SELECT * FROM participantes_publico WHERE id_participante = :id", {"id": id})
        return render_template("participantes/delete.html", participante=participante)

    execute(db, "DELETE FROM participante WHERE id_participante = :id", {"id": id})
    return respond("Participante eliminado", redirect_to=url_for("participantes.index"))

def fnTotalParticipantes():
    return db.session.execute(text("SELECT COUNT(*) FROM participante")).scalar()


def fnTotalActivos():
    return db.session.execute(text("SELECT COUNT(*) FROM participante WHERE estado = 'activo'")).scalar()


def fnTotalMenores():
    sql = """
        SELECT COUNT(*)
        FROM participante p
        JOIN persona pe ON pe.id_persona = p.id_persona
        WHERE DATE_PART('year', AGE(pe.f_nacimiento)) < 18
    """
    return db.session.execute(text(sql)).scalar()