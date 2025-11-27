from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

servicios_bp = Blueprint("servicios", __name__, url_prefix="/servicios")


@servicios_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM servicios_publico")
    return render_template("servicios/index.html", data=datos)


@servicios_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        periodos = query_all(db, "SELECT * FROM periodos_publico")
        horarios = query_all(db, "SELECT * FROM horarios_publico")
        salones = query_all(db, "SELECT * FROM salones_publico")
        return render_template("servicios/form.html", periodos=periodos, horarios=horarios, salones=salones, servicio=None)

    data = get_data()
    
    # Verificar si ya existe una actividad con ese código
    try:
        existing = query_one(db, "SELECT id_actividad FROM actividad WHERE cod_actividad = :cod", {"cod": data.get("cod_actividad")})
        return respond("Ya existe una actividad con ese código", success=False, redirect_to=url_for("servicios.index"), status=400)
    except:
        pass  # No existe, continuar
    
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
    
    # Luego crear el servicio
    execute(db, "INSERT INTO servicio (id_actividad, tipo, estado) VALUES (:id_actividad, :tipo, :estado)", {
        "id_actividad": actividad["id_actividad"],
        "tipo": data.get("tipo", ""),
        "estado": data.get("estado", "activo"),
    })
    
    return respond("Servicio creado", redirect_to=url_for("servicios.index"), status=201)


@servicios_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        servicio = query_one(db, """
            SELECT s.id_servicio, s.id_actividad, s.tipo, s.estado,
                   a.cod_actividad, a.nombre, a.descripcion,
                   a.id_periodo, a.id_horario, a.id_salon
            FROM servicio s
            JOIN actividad a ON a.id_actividad = s.id_actividad
            WHERE s.id_servicio = :id
        """, {"id": id})
        periodos = query_all(db, "SELECT * FROM periodos_publico")
        horarios = query_all(db, "SELECT * FROM horarios_publico")
        salones = query_all(db, "SELECT * FROM salones_publico")
        return render_template("servicios/form.html", periodos=periodos, horarios=horarios, salones=salones, servicio=servicio)

    data = get_data()
    
    # Obtener el id_actividad del servicio
    servicio = query_one(db, "SELECT id_actividad FROM servicio WHERE id_servicio = :id", {"id": id})
    
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
        "id_actividad": servicio["id_actividad"],
    })
    
    # Actualizar el servicio
    execute(db, "UPDATE servicio SET tipo = :tipo, estado = :estado WHERE id_servicio = :id", {
        "tipo": data.get("tipo", ""),
        "estado": data.get("estado", "activo"),
        "id": id,
    })
    
    return respond("Servicio actualizado", redirect_to=url_for("servicios.index"))


@servicios_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        servicio = query_one(db, "SELECT * FROM servicios_publico WHERE id_servicio = :id", {"id": id})
        return render_template("servicios/delete.html", servicio=servicio)

    # Obtener el id_actividad antes de eliminar el servicio
    servicio = query_one(db, "SELECT id_actividad FROM servicio WHERE id_servicio = :id", {"id": id})
    
    # Eliminar el servicio
    execute(db, "DELETE FROM servicio WHERE id_servicio = :id", {"id": id})
    
    # Eliminar la actividad asociada
    execute(db, "DELETE FROM actividad WHERE id_actividad = :id_actividad", {"id_actividad": servicio["id_actividad"]})
    
    return respond("Servicio eliminado", redirect_to=url_for("servicios.index"))
