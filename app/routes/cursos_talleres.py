from ..db import Database
from ..models import CursoTaller
from flask import Blueprint, render_template, request

db = Database.db


cursos_talleres_bp = Blueprint(
    "cursos_talleres", __name__, url_prefix="/cursos_talleres"
)


@cursos_talleres_bp.route("/")
def cursos_talleres():
    data = CursoTaller.get_view()
    total = CursoTaller.count_all()
    return render_template("cursos_talleres/index.html", r1=total, data=data)


@cursos_talleres_bp.route("/form", methods=["GET", "POST"])
def cursos_talleres_form():
    return render_template("cursos_talleres/form.html")


@cursos_talleres_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar_curso_taller(id):
    curso_taller = CursoTaller.get_by_id(id)
    if not curso_taller:
        return "Curso/Taller no encontrado", 404

    return render_template("cursos_talleres/editar.html", curso_taller=curso_taller)
