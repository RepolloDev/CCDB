from ..db import Database
from flask import Blueprint, render_template

db = Database.db


cursos_talleres_bp = Blueprint(
    "cursos_talleres", __name__, url_prefix="/cursos_talleres"
)

@cursos_talleres_bp.route("/")
def cursos_talleres():
    with db.engine.connect() as connection:
        result = connection.execute(
            
        )
    return render_template("cursos_talleres/index.html")
