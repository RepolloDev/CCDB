from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

cursos_talleres_bp = Blueprint("cursos_talleres", __name__, url_prefix="/cursos_talleres")


@cursos_talleres_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM curso_taller_publico ORDER BY id_curtal")
    return render_template("cursos_talleres/index.html", data=datos)


@cursos_talleres_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        periodos = query_all(db, "SELECT * FROM periodos_publico")
        horarios = query_all(db, "SELECT * FROM horarios_publico")
        salones = query_all(db, "SELECT * FROM salones_publico")
        voluntarios = query_all(db, "SELECT * FROM voluntarios_publico")
        return render_template("cursos_talleres/form.html", periodos=periodos, horarios=horarios, salones=salones, voluntarios=voluntarios, curso=None)

    data = get_data()
    
    # Primero crear la actividad
    execute(db, """
        INSERT INTO actividad (cod_actividad, nombre, descripcion, id_periodo, id_horario, id_salon)
        VALUES (:cod_actividad, :nombre, :descripcion, :id_periodo, :id_horario, :id_salon)
    """, {
        "cod_actividad": data.get("cod_actividad"),
        "nombre": data.get("nombre"),
        "descripcion": data.get("descripcion"),
        "id_periodo": data.get("id_periodo") or None,
        "id_horario": data.get("id_horario") or None,
        "id_salon": data.get("id_salon") or None,
    })
    
    # Obtener el id de la actividad recién creada
    actividad = query_one(db, "SELECT id_actividad FROM actividad WHERE cod_actividad = :cod", {"cod": data.get("cod_actividad")})
    
    # Luego crear el curso_taller
    execute(db, "INSERT INTO curso_taller (id_actividad, enlace, id_voluntario) VALUES (:id_actividad, :enlace, :id_voluntario)", {
        "id_actividad": actividad["id_actividad"],
        "enlace": data.get("enlace"),
        "id_voluntario": data.get("id_voluntario") or None,
    })
    
    return respond("Curso/Taller creado", redirect_to=url_for("cursos_talleres.index"), status=201)


@cursos_talleres_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        curso = query_one(db, """
            SELECT ct.id_curtal, ct.id_actividad, ct.enlace, ct.id_voluntario,
                   a.cod_actividad, a.nombre as nombre_actividad, a.descripcion,
                   a.id_periodo, a.id_horario, a.id_salon
            FROM curso_taller ct
            JOIN actividad a ON a.id_actividad = ct.id_actividad
            WHERE ct.id_curtal = :id
        """, {"id": id})
        periodos = query_all(db, "SELECT * FROM periodos_publico")
        horarios = query_all(db, "SELECT * FROM horarios_publico")
        salones = query_all(db, "SELECT * FROM salones_publico")
        voluntarios = query_all(db, "SELECT * FROM voluntarios_publico")
        return render_template("cursos_talleres/form.html", periodos=periodos, horarios=horarios, salones=salones, voluntarios=voluntarios, curso=curso)

    data = get_data()
    
    # Obtener el id_actividad del curso
    curso = query_one(db, "SELECT id_actividad FROM curso_taller WHERE id_curtal = :id", {"id": id})
    
    # Actualizar la actividad
    execute(db, """
        UPDATE actividad 
        SET cod_actividad = :cod_actividad, 
            nombre = :nombre, 
            descripcion = :descripcion,
            id_periodo = :id_periodo,
            id_horario = :id_horario,
            id_salon = :id_salon,
            f_edicion = now()
        WHERE id_actividad = :id_actividad
    """, {
        "cod_actividad": data.get("cod_actividad"),
        "nombre": data.get("nombre"),
        "descripcion": data.get("descripcion"),
        "id_periodo": data.get("id_periodo") or None,
        "id_horario": data.get("id_horario") or None,
        "id_salon": data.get("id_salon") or None,
        "id_actividad": curso["id_actividad"],
    })
    
    # Actualizar el curso_taller
    execute(db, "UPDATE curso_taller SET enlace = :enlace, id_voluntario = :id_voluntario WHERE id_curtal = :id", {
        "enlace": data.get("enlace"),
        "id_voluntario": data.get("id_voluntario") or None,
        "id": id,
    })
    
    return respond("Curso/Taller actualizado", redirect_to=url_for("cursos_talleres.index"))


@cursos_talleres_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        curso = query_one(db, "SELECT * FROM curso_taller_publico WHERE id_curtal = :id", {"id": id})
        return render_template("cursos_talleres/delete.html", curso=curso)

    # Obtener el id_actividad antes de eliminar el curso_taller
    curso = query_one(db, "SELECT id_actividad FROM curso_taller WHERE id_curtal = :id", {"id": id})
    
    # Eliminar el curso_taller
    execute(db, "DELETE FROM curso_taller WHERE id_curtal = :id", {"id": id})
    
    # Eliminar la actividad asociada
    execute(db, "DELETE FROM actividad WHERE id_actividad = :id_actividad", {"id_actividad": curso["id_actividad"]})
    
    return respond("Curso/Taller eliminado", redirect_to=url_for("cursos_talleres.index"))
