from ..db import Database
from flask import Blueprint, render_template
from sqlalchemy import text

db = Database.db


cursos_talleres_bp = Blueprint(
    "cursos_talleres", __name__, url_prefix="/cursos_talleres"
)


# Ruta base /curso_talleres/
@cursos_talleres_bp.route("/")
def cursos_talleres():
    try:
        query_sql = text("SELECT * FROM curso_taller_publico")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta: ", e)
        datos_crudos = []
    return render_template("cursos_talleres/index.html", data=datos_crudos)


@cursos_talleres_bp.route("/create", methods=["POST"])
def crear_curtal():
    pass


@cursos_talleres_bp.route("/delete/<int:id>", methods=["POST"])
def eliminar_curtal(id):
    pass


# @cursos_talleres_bp.route("/form", methods=["GET", "POST"])
# def cursos_talleres_form():
#     return render_template("cursos_talleres/form.html")


# @cursos_talleres_bp.route("/editar/<int:id>", methods=["GET", "POST"])
# def editar_curso_taller(id):
#     curso_taller = CursoTaller.get_by_id(id)
#     if not curso_taller:
#         return "Curso/Taller no encontrado", 404

#     return render_template("cursos_talleres/editar.html", curso_taller=curso_taller)
