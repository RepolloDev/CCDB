from flask import Blueprint, render_template, request, redirect, url_for
from ..db import Database
from ..utils import get_data, is_ajax, respond, query_one, query_all, query_values, execute

db = Database.db

tutores_bp = Blueprint("tutores", __name__, url_prefix="/tutores")


@tutores_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM tutores_publico")
    return render_template("tutores/index.html", data=datos)


@tutores_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        return render_template("tutores/form.html", tutor=None)

    data = get_data()
    
    # Crear persona primero
    id_persona = execute(db, """
        INSERT INTO persona(nombre, paterno, materno, ci, genero, f_nacimiento)
        VALUES(:nombre, :paterno, :materno, :ci, :genero, :f_nacimiento)
        RETURNING id_persona
    """, data)
    
    # Crear tutor
    execute(db, """
        INSERT INTO tutor(id_persona, parentesco)
        VALUES(:id_persona, :parentesco)
    """, {"id_persona": id_persona, "parentesco": data.get("parentesco", "")})
    
    return respond("Tutor creado", redirect_to=url_for("tutores.index"), status=201)


@tutores_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        tutor = query_one(db, """
            SELECT t.id_tutor, p.nombre, p.paterno, p.materno, p.ci, p.genero, 
                   TO_CHAR(p.f_nacimiento, 'YYYY-MM-DD') as f_nacimiento, t.parentesco
            FROM tutor t
            JOIN persona p ON p.id_persona = t.id_persona
            WHERE t.id_tutor = :id
        """, {"id": id})
        return render_template("tutores/form.html", tutor=tutor)

    data = get_data()
    
    # Obtener id_persona del tutor
    tutor = query_one(db, "SELECT id_persona FROM tutor WHERE id_tutor = :id", {"id": id})
    
    if tutor:
        # Actualizar persona
        execute(db, """
            UPDATE persona
            SET nombre = :nombre, paterno = :paterno, materno = :materno,
                ci = :ci, genero = :genero, f_nacimiento = :f_nacimiento
            WHERE id_persona = :id_persona
        """, {**data, "id_persona": tutor["id_persona"]})
        
        # Actualizar tutor
        execute(db, """
            UPDATE tutor
            SET parentesco = :parentesco
            WHERE id_tutor = :id
        """, {"parentesco": data.get("parentesco", ""), "id": id})
    
    return respond("Tutor actualizado", redirect_to=url_for("tutores.index"))


@tutores_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        tutor = query_one(db, """
            SELECT t.id_tutor, p.nombre||' '||p.paterno||' '||p.materno AS nombre_completo, t.parentesco
            FROM tutor t
            JOIN persona p ON p.id_persona = t.id_persona
            WHERE t.id_tutor = :id
        """, {"id": id})
        return render_template("tutores/delete.html", tutor=tutor)

    execute(db, "DELETE FROM tutor WHERE id_tutor = :id", {"id": id})
    return respond("Tutor eliminado", redirect_to=url_for("tutores.index"))

