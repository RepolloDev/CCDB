import os
from flask import Flask, render_template, request, jsonify
from sqlalchemy import text
from urllib.parse import quote_plus
from flask import Flask, render_template, request, jsonify
from sqlalchemy.exc import IntegrityError
from .db import Database


from .routes.cursos_talleres import cursos_talleres_bp
from .routes.inscripciones import inscripciones_bp
from .routes.participantes import participantes_bp
from .routes.salones import salones_bp
from .routes.servicios import servicios_bp
from .routes.aportes import aportes_bp
from .routes.horarios import horarios_bp
from .routes.periodos import periodos_bp

from .routes.voluntarios import voluntarios_bp
from .routes.tutores import tutores_bp
from .routes.asignaciones import asignaciones_bp

from datetime import date


# para asegurarme de que el url de conexion es exitosa con el postgres
print("DATABASE_URL:", Database.make_database_uri())

app = Flask(__name__)
# Secret key is required for session/flash to work. Use environment variable in production.
app.secret_key = os.environ.get("SECRET_KEY", "dev-secret-key-change-this")
db = Database.init_app(app)

app.register_blueprint(cursos_talleres_bp)
app.register_blueprint(participantes_bp)
app.register_blueprint(inscripciones_bp)
app.register_blueprint(voluntarios_bp)
app.register_blueprint(tutores_bp)
app.register_blueprint(salones_bp)
app.register_blueprint(servicios_bp)
app.register_blueprint(aportes_bp)
app.register_blueprint(horarios_bp)
app.register_blueprint(periodos_bp)
app.register_blueprint(asignaciones_bp)


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
    try:
        query_sql = text("SELECT COUNT(*) as count FROM curso_taller")
        result_proxy = db.session.execute(query_sql).fetchone()
        cantidad_curso_taller = result_proxy[0]

        query_sql = text("SELECT COUNT(*) as count FROM servicio")
        result_proxy = db.session.execute(query_sql).fetchone()
        cantidad_servicio = result_proxy[0]

        query_sql = text("SELECT * FROM cantidad_participantes_mes")
        result_proxy = db.session.execute(query_sql).fetchone()
        cantidad_participante = result_proxy[0]

        query_sql = text("SELECT * FROM cantidad_voluntarios_mes")
        result_proxy = db.session.execute(query_sql).fetchone()
        cantidad_voluntario = result_proxy[0]

        query_sql = text("SELECT * FROM total_aportes_anio")
        result_proxy = db.session.execute(query_sql).fetchone()
        total_aporte_anual = result_proxy[0]

        query_sql = text("SELECT * FROM cantidad_aportantes_anio")
        result_proxy = db.session.execute(query_sql).fetchone()
        cantidad_aportantes_anual = result_proxy[0]

        datos_crudos = {
            "cursos_talleres": cantidad_curso_taller,
            "servicios": cantidad_servicio,
            "participantes": cantidad_participante,
            "voluntarios": cantidad_voluntario,
            "aporte_anual": total_aporte_anual,
            "aportantes_anual": cantidad_aportantes_anual
        }
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = {"cursos_talleres": 0, "servicios": 0}

    try:
        # --- consulta dinámica para el gráfico ---
        query_sql = text("SELECT anio, mes, total FROM aportes_grafica")
        resultados = db.session.execute(query_sql).fetchall()

        # meses en español
        categories = ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"]

        # diccionario para acumular datos por año
        datos_por_anio = {}
        for fila in resultados:
            anio, mes, total = fila
            if anio not in datos_por_anio:
                datos_por_anio[anio] = [0]*12  # inicializa con 12 meses en 0
            datos_por_anio[anio][int(mes)-1] = total  # coloca el total en el mes correcto

        # construir series
        series = []
        for anio, valores in datos_por_anio.items():
            series.append({
                "name": f"{int(anio)}",
                "data": valores
            })

        chart_area_data = {
            "categories": categories,
            "series": series
        }

    except Exception as e:
        print("Error en la consulta", e)
        chart_area_data = {}

    try:
        # --- consulta para distribución de edades ---
        query_sql = text("""
            SELECT
                SUM(CASE WHEN EXTRACT(YEAR FROM AGE(current_date, p.f_nacimiento)) < 18 THEN 1 ELSE 0 END) AS menores_18,
                SUM(CASE WHEN EXTRACT(YEAR FROM AGE(current_date, p.f_nacimiento)) BETWEEN 18 AND 35 THEN 1 ELSE 0 END) AS entre_18_35,
                SUM(CASE WHEN EXTRACT(YEAR FROM AGE(current_date, p.f_nacimiento)) > 35 THEN 1 ELSE 0 END) AS mayores_35
            FROM aporte a
            JOIN participante pa ON a.id_participante = pa.id_participante
            JOIN persona p ON pa.id_persona = p.id_persona
        """)
        result_proxy = db.session.execute(query_sql).fetchone()
        menores_18, entre_18_35, mayores_35 = result_proxy

        total = (menores_18 or 0) + (entre_18_35 or 0) + (mayores_35 or 0)

        if total > 0:
            porc_menores = round((menores_18 / total) * 100, 2)
            porc_18_35 = round((entre_18_35 / total) * 100, 2)
            porc_mayores = round((mayores_35 / total) * 100, 2)
        else:
            porc_menores, porc_18_35, porc_mayores = 0, 0, 0

        chart_donut_data = {
            "series": [porc_menores, porc_18_35, porc_mayores],
            "labels": ["< 18", "18 - 35", "> 35"],
        }

    except Exception as e:
        print("Error en la consulta de edades:", e)
        chart_donut_data = {
            "series": [0, 0, 0],
            "labels": ["< 18", "18 - 35", "> 35"],
        }

    return render_template(
        "inicio.html",
        area_data=chart_area_data,
        donut_data=chart_donut_data,
        datos=datos_crudos
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


"""
@app.route("/participantes")
def participantes():
    # Participantes
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

    # TUTORES PARA EL COMBO DEL MODAL
    tutores = db.session.execute(text("SELECT * FROM tutores_select")).mappings().all()

    return render_template(
        "participantes/index.html", data=datos_crudos, tutores=tutores
    )


@app.post("/participantes/create")
def crear_participante():
    data = request.json

    # -------- VALIDACIONES BÁSICAS --------
    required_persona = ["nombre", "paterno", "ci", "fecha_nacimiento"]
    for field in required_persona:
        if not data.get(field):
            return jsonify({"error": f"El campo {field} es obligatorio"}), 400

    # -------- VALIDAR FECHA DE NACIMIENTO --------
    try:
        nacimiento = date.fromisoformat(data["fecha_nacimiento"])
        if nacimiento > date.today():
            return jsonify({"error": "La fecha de nacimiento no puede ser futura"}), 400
    except ValueError:
        return jsonify({"error": "Formato de fecha inválido, usar YYYY-MM-DD"}), 400

    edad = (date.today() - nacimiento).days // 365
    menor_de_edad = edad < 18

    # -------- VALIDAR TUTOR --------
    id_tutor = data.get("id_tutor")
    if menor_de_edad and not id_tutor:
        return jsonify({"error": "El tutor es obligatorio para menores de edad"}), 400

    try:
        # -------- SINCRONIZAR SECUENCIA DE id_persona --------
        db.session.execute(
            text(
                "SELECT setval('persona_id_persona_seq', (SELECT COALESCE(MAX(id_persona),0) FROM persona))"
            )
        )
        print("[INFO] Secuencia de id_persona sincronizada con el máximo valor actual.")

        # -------- BUSCAR PERSONA POR CI --------
        persona_existente = db.session.execute(
            text("SELECT id_persona FROM persona WHERE ci = :ci"), {"ci": data["ci"]}
        ).first()

        if persona_existente:
            id_persona = persona_existente[0]
            print(
                f"[INFO] Persona existente encontrada: id_persona={id_persona}, CI={data['ci']}"
            )
            db.session.execute(
                text(\"\"\"
                    UPDATE persona SET
                        nombre = :nombre,
                        paterno = :paterno,
                        materno = :materno,
                        celular = :celular,
                        genero = :genero,
                        f_nacimiento = :fn,
                        zona = :zona,
                        calle = :calle,
                        nro = :nro,
                        f_edicion = now()
                    WHERE id_persona = :idp
                \"\"\"),
                {
                    "nombre": data["nombre"],
                    "paterno": data["paterno"],
                    "materno": data.get("materno", ""),
                    "celular": data.get("celular", ""),
                    "genero": data.get("genero", ""),
                    "fn": data["fecha_nacimiento"],
                    "zona": data.get("zona", ""),
                    "calle": data.get("barrio", ""),
                    "nro": data.get("nro_casa", ""),
                    "idp": id_persona,
                },
            )
            print(
                f"[INFO] Persona actualizada en la tabla persona: id_persona={id_persona}"
            )
        else:
            # -------- INSERTAR NUEVA PERSONA --------
            persona_sql = text(\"\"\"
                INSERT INTO persona (nombre, paterno, materno, ci, celular, genero, f_nacimiento, zona, calle, nro)
                VALUES (:nombre, :paterno, :materno, :ci, :celular, :genero, :fn, :zona, :calle, :nro)
                RETURNING id_persona
            \"\"\")
            res = db.session.execute(
                persona_sql,
                {
                    "nombre": data["nombre"],
                    "paterno": data["paterno"],
                    "materno": data.get("materno", ""),
                    "ci": data["ci"],
                    "celular": data.get("celular", ""),
                    "genero": data.get("genero", ""),
                    "fn": data["fecha_nacimiento"],
                    "zona": data.get("zona", ""),
                    "calle": data.get("barrio", ""),
                    "nro": data.get("nro_casa", ""),
                },
            )
            id_persona = res.scalar()
            print(
                f"[INFO] Nueva persona insertada: id_persona={id_persona}, CI={data['ci']}"
            )

        # -------- SINCRONIZAR SECUENCIA DE id_participante --------
        db.session.execute(
            text(
                "SELECT setval('participante_id_participante_seq', (SELECT COALESCE(MAX(id_participante),0) FROM participante))"
            )
        )
        print(
            "[INFO] Secuencia de id_participante sincronizada con el máximo valor actual."
        )

        # -------- VERIFICAR PARTICIPANTE EXISTENTE --------
        participante_existente = db.session.execute(
            text(
                "SELECT id_participante, matricula FROM participante WHERE id_persona = :idp"
            ),
            {"idp": id_persona},
        ).first()

        if participante_existente:
            matricula_generada = participante_existente[1]
            print(
                f"[INFO] Participante ya existe: id_participante={participante_existente[0]}, matricula={matricula_generada}"
            )
        else:
            # -------- INSERTAR PARTICIPANTE --------
            participante_sql = text(\"\"\"
                INSERT INTO participante (id_persona, estado, id_tutor)
                VALUES (:idp, :estado, :idt)
                RETURNING matricula
            \"\"\")
            res_part = db.session.execute(
                participante_sql,
                {
                    "idp": id_persona,
                    "estado": data.get("estado", "activo"),
                    "idt": id_tutor,
                },
            )
            matricula_generada = res_part.scalar()
            print(
                f"[INFO] Nuevo participante insertado: id_persona={id_persona}, matricula={matricula_generada}"
            )

        db.session.commit()

        return jsonify(
            {
                "ok": True,
                "message": "Participante registrado con éxito",
                "matricula": matricula_generada,
            }
        )

    except IntegrityError as ie:
        db.session.rollback()
        print(f"[ERROR] IntegrityError: {ie}")
        return jsonify({"error": "Datos duplicados o inválidos"}), 409
    except Exception as e:
        db.session.rollback()
        print(f"[ERROR] Exception: {e}")
        return jsonify({"error": str(e)}), 500
"""


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


# @app.route("/voluntarios")
# def voluntarios():
#     try:
#         query_sql = text("SELECT * FROM voluntarios_publico")
#         result_proxy = db.session.execute(query_sql)
#         datos_crudos = [
#             [row["id_voluntario"], row["nombre_completo"], row["correo"], row["tipo"]]
#             for row in result_proxy.mappings()
#         ]
#     except Exception as e:
#         print("Error en la consulta:", e)
#         datos_crudos = []

#     return render_template("voluntarios/index.html", data=datos_crudos)


"""
CREATE OR ALTER VIEW tutores_publico
AS
	SELECT 	t.id_tutor,
    		(((p.nombre::text || ' '::text) || p.paterno::text) || ' '::text) || p.materno::text AS nombre_completo,
    		t.parentesco
	FROM tutor t
	JOIN persona p ON p.id_persona = t.id_persona;
"""


# @app.route("/tutores")
# def tutores():
#     try:
#         query_sql = text("SELECT * FROM tutores_publico")
#         result_proxy = db.session.execute(query_sql)
#         datos_crudos = [
#             [row["id_tutor"], row["nombre_completo"], row["parentesco"]]
#             for row in result_proxy.mappings()
#         ]
#     except Exception as e:
#         print("Error en la consulta:", e)
#         datos_crudos = []

#     return render_template("tutores/index.html", data=datos_crudos)


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


# @app.route("/cursos_talleres")
# def cursos_talleres():
#     try:
#         query_sql = text("SELECT * FROM cursos_talleres_publico")
#         result_proxy = db.session.execute(query_sql)
#         datos_crudos = [
#             [
#                 row["id_curtal"],
#                 row["cod_actividad"],
#                 row["nombre"],
#                 row["enlace"],
#                 row["voluntario"],
#             ]
#             for row in result_proxy.mappings()
#         ]
#     except Exception as e:
#         print("Error en la consulta: ", e)
#         datos_crudos = []

#     return render_template("cursos_talleres/index.html", data=datos_crudos)


"""
CREATE OR REPLACE VIEW servicios_publico
AS
	SELECT s.id_servicio, a.cod_actividad, a.nombre, s.tipo, s.estado
	FROM servicio s 
	JOIN actividad a ON a.id_actividad = s.id_actividad
"""


# @app.route("/servicios")
# def servicios():
#     try:
#         query_sql = text("SELECT * FROM servicios_publico")
#         result_proxy = db.session.execute(query_sql)
#         datos_crudos = [
#             [
#                 row["id_servicio"],
#                 row["cod_actividad"],
#                 row["nombre"],
#                 row["tipo"],
#                 row["estado"],
#             ]
#             for row in result_proxy.mappings()
#         ]
#     except Exception as e:
#         print("Error en la consulta:", e)
#         datos_crudos = []

#     return render_template("servicios/index.html", data=datos_crudos)


# endregion


# region Operaciones
# @app.route("/inscripciones")
# def inscripciones():
#     return render_template("inscripciones.html")


# @app.route("/asignaciones")
# def asignaciones():
#     return render_template("asignaciones.html")


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


# @app.route("/salones")
# def salones():
#     return render_template("salones.html")


# @app.route("/horarios")
# def horarios():
#     return render_template("horarios.html")


# endregion
