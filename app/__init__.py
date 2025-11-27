from flask import Flask, render_template
from sqlalchemy import text
from .db import Database
# from .routes.cursos_talleres import cursos_talleres_bp


# para asegurarme de que el url de conexion es exitosa con el postgres
print("DATABASE_URL:", Database.make_database_uri())

app = Flask(__name__)
db = Database.init_app(app)

# app.register_blueprint(cursos_talleres_bp)


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


# region PARTICIPANTES

"""
CREATE OR REPLACE VIEW participantes_publico
AS
	SELECT p.id_participante, pe.nombre ||' '||pe.paterno||' '||pe.materno AS nombre_completo, pe.ci, p.matricula, p.estado, COALESCE(tx.datos_tutor,'') AS datos_tutor
	FROM participante p
	JOIN persona pe ON pe.id_persona = p.id_persona
	LEFT JOIN (	SELECT t.id_tutor, p.nombre||' '||p.paterno||' '||p.materno||' ('||t.parentesco||')' as datos_tutor
			FROM tutor t
			JOIN persona p ON p.id_persona = t.id_persona) tx ON tx.id_tutor = p.id_tutor
"""


@app.route("/participantes")
def participantes():
    try:
        query_sql = text("SELECT * FROM participantes_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [
            [
                row["id_participante"],
                row["nombre_completo"],
                row["ci"],
                row["matricula"],
                row["estado"],
                row["datos_tutor"],
            ]
            for row in result_proxy.mappings()
        ]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("participantes/index.html", data=datos_crudos)


"""
CREATE OR ALTER VIEW voluntarios_publico
AS
	SELECT 	v.id_voluntario,
			(((p.nombre::text || ' '::text) || p.paterno::text) || ' '::text) || p.materno::text AS nombre_completo,
	    	v.correo,
	    	ne.tipo
	FROM voluntario v
	JOIN persona p ON p.id_persona = v.id_persona
	JOIN nivel_educacion ne ON ne.id_nvl_edu = v.id_nvl_edu
"""


@app.route("/voluntarios")
def voluntarios():
    try:
        query_sql = text("SELECT * FROM voluntarios_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [
            [row["id_voluntario"], row["nombre_completo"], row["correo"], row["tipo"]]
            for row in result_proxy.mappings()
        ]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("voluntarios/index.html", data=datos_crudos)


"""
CREATE OR ALTER VIEW tutores_publico
AS
	SELECT 	t.id_tutor,
    		(((p.nombre::text || ' '::text) || p.paterno::text) || ' '::text) || p.materno::text AS nombre_completo,
    		t.parentesco
	FROM tutor t
	JOIN persona p ON p.id_persona = t.id_persona;
"""


@app.route("/tutores")
def tutores():
    try:
        query_sql = text("SELECT * FROM tutores_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [
            [row["id_tutor"], row["nombre_completo"], row["parentesco"]]
            for row in result_proxy.mappings()
        ]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("tutores/index.html", data=datos_crudos)


# endregion


# region Actividades
"""
CREATE OR REPLACE VIEW cursos_talleres_publico
AS
	SELECT ct.id_curtal, a.cod_actividad, a.nombre, ct.enlace, p.nombre||' '||p.paterno||' '||p.materno AS voluntario
	FROM curso_taller ct
	JOIN actividad a ON a.id_actividad = ct.id_actividad
	JOIN voluntario v ON v.id_voluntario = ct.id_voluntario
	JOIN persona p ON p.id_persona = v.id_persona
"""


@app.route("/cursos_talleres")
def cursos_talleres():
    try:
        query_sql = text("SELECT * FROM cursos_talleres_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [
            [
                row["id_curtal"],
                row["cod_actividad"],
                row["nombre"],
                row["enlace"],
                row["voluntario"],
            ]
            for row in result_proxy.mappings()
        ]
    except Exception as e:
        print("Error en la consulta: ", e)
        datos_crudos = []

    return render_template("cursos_talleres/index.html", data=datos_crudos)


"""
CREATE OR REPLACE VIEW servicios_publico
AS
	SELECT s.id_servicio, a.cod_actividad, a.nombre, s.tipo, s.estado
	FROM servicio s 
	JOIN actividad a ON a.id_actividad = s.id_actividad
"""


@app.route("/servicios")
def servicios():
    try:
        query_sql = text("SELECT * FROM servicios_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [
            [
                row["id_servicio"],
                row["cod_actividad"],
                row["nombre"],
                row["tipo"],
                row["estado"],
            ]
            for row in result_proxy.mappings()
        ]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    return render_template("servicios/index.html", data=datos_crudos)


# endregion


# region Operaciones
@app.route("/inscripciones")
def inscripciones():
    return render_template("inscripciones.html")


@app.route("/asignaciones")
def asignaciones():
    return render_template("asignaciones.html")


"""
CREATE OR ALTER VIEW aportes_publico
AS
	SELECT 	a.id_aporte,a.monto_total, a.descripcion, a.f_creacion, a.f_edicion,
    p.nombre||' '||p.paterno::text)||' '||p.materno AS nombre_completo
   	FROM aporte a
	JOIN participante pa ON pa.id_participante = a.id_participante
	JOIN persona p ON p.id_persona = pa.id_persona;
"""


# @app.route("/aportes")
# def aportes():
#     try:
#         query_sql = text("SELECT * FROM aportes_publico")
#         result_proxy = db.session.execute(query_sql)
#         datos_crudos = [dict(row) for row in result_proxy.mappings()]
#     except Exception as e:
#         print("Error en la consulta:", e)
#         datos_crudos = []

#     # Armamos la estructura final
#     aportes_data = {"columns": columnas, "data": datos_crudos}

#     # Pasamos la estructura al template
#     return render_template("aportes/index.html", data=aportes_data)


# endregion


# region Organización


# @app.route("/periodos")
# def periodos():
#     try:
#         query_sql = text("SELECT * FROM periodo")
#         result_proxy = db.session.execute(query_sql)
#         datos_crudos = []
#         for row in result_proxy.mappings():
#             datos_crudos.append(
#                 [
#                     row["id_periodo"],
#                     datetime.strptime(
#                         str(row["f_inicio"]), "%a, %d %b %Y %H:%M:%S %Z"
#                     ).strftime("%d/%m/%Y"),
#                     datetime.strptime(
#                         str(row["f_fin"]), "%a, %d %b %Y %H:%M:%S %Z"
#                     ).strftime("%d/%m/%Y"),
#                     datetime.strptime(
#                         str(row["f_creacion"]), "%a, %d %b %Y %H:%M:%S %Z"
#                     ).strftime("%d/%m/%Y %H:%M"),
#                     datetime.strptime(
#                         str(row["f_edicion"]), "%a, %d %b %Y %H:%M:%S %Z"
#                     ).strftime("%d/%m/%Y %H:%M"),
#                 ]
#             )
#     except Exception as e:
#         print("Error en la consulta:", e)
#         datos_crudos = []

#     return render_template("periodos/index.html", data=datos_crudos)


@app.route("/salones")
def salones():
    return render_template("salones.html")


@app.route("/horarios")
def horarios():
    return render_template("horarios.html")


# endregion
