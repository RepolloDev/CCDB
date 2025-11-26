from flask import Flask, render_template
from sqlalchemy import text
from .db import Database
from .routes.cursos_talleres import cursos_talleres_bp

app = Flask(__name__)
db = Database.init_app(app)

app.register_blueprint(cursos_talleres_bp)


@app.route("/test")
def test():
    query_sql = text("select * from participantes_publico")
    result_proxy = db.session.execute(query_sql)
    datos_crudos = [dict(row) for row in result_proxy.mappings()]
    salida_texto = str(datos_crudos)
    return render_template("tests/db.html", data=salida_texto)


@app.route("/login")
def login():
    return render_template("login.html")


@app.route("/")
def home():
    # return to page inicio.html
    chart_area_data = {
        "categories": ["Ene", "Feb", "Mar", "Abr", "May"],
        "series": [
            {"name": "Aportes actuales", "data": [30, 40, 35, 50, 49]},
            {"name": "Aportes del año pasado", "data": [10, 20, 15, 30, 25]},
        ],
    }
    chart_donut_data = {
        "series": [80, 10, 10],  # 80% Transacciones, 10% Venta, 10% Retorno
        "labels": ["< 18", "18 - 35", "> 35"],
    }

    return render_template(
        "inicio.html", area_data=chart_area_data, donut_data=chart_donut_data
    )


# region PERSONAS

"""
CREATE OR REPLACE VIEW participantes_publico
AS
	SELECT p.id_participante, pe.nombre ||' '||pe.paterno||' '||pe.materno AS nombre_completo, pe.ci, p.matricula, p.estado, tx.datos_tutor 
	FROM participante p
	JOIN persona pe ON pe.id_persona = p.id_persona
	LEFT JOIN (	SELECT t.id_tutor, p.nombre||' '||p.paterno||' '||p.materno||' ('||t.parentesco||')' as datos_tutor
			FROM tutor t
			JOIN persona p ON p.id_persona = t.id_persona) tx ON tx.id_tutor = p.id_tutor
"""


@app.route("/participantes")
def participantes():
    # Definimos las columnas que queremos mostrar
    columnas = [
        {"id": "id_participante", "name": "ID"},
        {"id": "nombre_completo", "name": "Nombre"},
        {"id": "ci", "name": "Carnet"},
        {"id": "matricula", "name": "Matricula"},
        {"id": "estado", "name": "Estado"},
        {"id": "datos_tutor", "name": "Tutor"},
    ]

    # Ejecutamos la consulta
    query_sql = text("SELECT * FROM participantes_publico")
    result_proxy = db.session.execute(query_sql)

    # Convertimos cada fila en dict
    datos_crudos = [dict(row) for row in result_proxy.mappings()]

    # Armamos la estructura final
    participantes_data = {"columns": columnas, "data": datos_crudos}

    # Pasamos la estructura al template
    return render_template("participantes/index.html", data=participantes_data)


@app.route("/voluntarios")
def voluntarios():
    voluntarios_data = {
        "columns": [
            {"id": "ID", "name": "ID"},
            {"id": "Nombre", "name": "Nombre"},
            {"id": "Edad", "name": "Edad"},
            {"id": "Telefono", "name": "Teléfono"},
        ],
        "data": [
            {"ID": 1, "Nombre": "Andrea Flores", "Edad": 19, "Telefono": "700-111"},
            {"ID": 2, "Nombre": "Marco Rojas", "Edad": 21, "Telefono": "700-222"},
            {"ID": 3, "Nombre": "Lucía Ramos", "Edad": 17, "Telefono": "700-333"},
        ],
    }
    return render_template("voluntarios.html", data=voluntarios_data)


@app.route("/tutores")
def tutores():
    tutores_data = {
        "columns": [
            {"id": "ID", "name": "ID"},
            {"id": "Nombre", "name": "Nombre"},
            {"id": "Telefono", "name": "Teléfono"},
        ],
        "data": [
            {"ID": 1, "Nombre": "Carlos Rivas", "Telefono": "777-111"},
            {"ID": 2, "Nombre": "Marcela López", "Telefono": "777-222"},
            {"ID": 3, "Nombre": "Pedro Silva", "Telefono": "777-333"},
        ],
    }
    return render_template("tutores.html", data=tutores_data)


# endregion


# region Actividades
# @app.route("/cursos_talleres")
# def cursos_talleres():
#     return render_template("cursos_talleres/index.html")


@app.route("/servicios")
def servicios():
    return render_template("servicios.html")


# endregion


# region Operaciones
@app.route("/inscripciones")
def inscripciones():
    return render_template("inscripciones.html")


@app.route("/asignaciones")
def asignaciones():
    return render_template("asignaciones.html")


@app.route("/aportes")
def aportes():
    return render_template("aportes/index.html")


# endregion


# region Organización
@app.route("/periodos")
def periodos():
    return render_template("periodos.html")


@app.route("/salones")
def salones():
    return render_template("salones.html")


@app.route("/horarios")
def horarios():
    return render_template("horarios.html")


# endregion
