from flask import Flask, render_template
import os
from sqlalchemy import text
from urllib.parse import quote_plus
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
from flask import Flask, render_template, request, jsonify
from datetime import date
from sqlalchemy.exc import IntegrityError

load_dotenv()

db_user = os.getenv("DB_USER", "").strip()
db_password = os.getenv("DB_PASSWORD", "").strip()
db_host = os.getenv("DB_HOST", "localhost").strip()
db_port = os.getenv("DB_PORT", "5432").strip()
db_name = os.getenv("DB_NAME", "").strip()

db_password_quoted = quote_plus(db_password)

DATABASE_URL = (
    f"postgresql://{db_user}:{db_password_quoted}@{db_host}:{db_port}/{db_name}"
)

# para asegurarme de que el url de conexion es exitosa con el postgres
print("DATABASE_URL:", DATABASE_URL)

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = DATABASE_URL
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)


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
	SELECT p.id_participante, pe.nombre ||' '||pe.paterno||' '||pe.materno AS nombre_completo, pe.ci, p.matricula, p.estado, COALESCE(tx.datos_tutor,'') AS datos_tutor
	FROM participante p
	JOIN persona pe ON pe.id_persona = p.id_persona
	LEFT JOIN (	SELECT t.id_tutor, p.nombre||' '||p.paterno||' '||p.materno||' ('||t.parentesco||')' as datos_tutor
			FROM tutor t
			JOIN persona p ON p.id_persona = t.id_persona) tx ON tx.id_tutor = p.id_tutor
"""

@app.route("/participantes")
def participantes():
    columnas = [
        {"id": "id_participante", "name": "ID"},
        {"id": "nombre_completo", "name": "Nombre"},
        {"id": "ci", "name": "Carnet"},
        {"id": "matricula", "name": "Matricula"},
        {"id": "estado", "name": "Estado"},
        {"id": "datos_tutor", "name": "Tutor"},
    ]

    # Participantes
    try:
        query_sql = text("SELECT * FROM participantes_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [
            {k: (v if v is not None else "") for k, v in row.items()}
            for row in result_proxy.mappings()
        ]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    # TUTORES PARA EL COMBO DEL MODAL
    tutores = db.session.execute(
        text("SELECT * FROM tutores_select")
    ).mappings().all()

    participantes_data = {
        "columns": columnas,
        "data": datos_crudos
    }

    return render_template(
        "participantes/index.html",
        data=participantes_data,
        tutores=tutores
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
            text("SELECT setval('persona_id_persona_seq', (SELECT COALESCE(MAX(id_persona),0) FROM persona))")
        )
        print("[INFO] Secuencia de id_persona sincronizada con el máximo valor actual.")

        # -------- BUSCAR PERSONA POR CI --------
        persona_existente = db.session.execute(
            text("SELECT id_persona FROM persona WHERE ci = :ci"),
            {"ci": data["ci"]}
        ).first()

        if persona_existente:
            id_persona = persona_existente[0]
            print(f"[INFO] Persona existente encontrada: id_persona={id_persona}, CI={data['ci']}")
            db.session.execute(
                text("""
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
                """),
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
                    "idp": id_persona
                }
            )
            print(f"[INFO] Persona actualizada en la tabla persona: id_persona={id_persona}")
        else:
            # -------- INSERTAR NUEVA PERSONA --------
            persona_sql = text("""
                INSERT INTO persona (nombre, paterno, materno, ci, celular, genero, f_nacimiento, zona, calle, nro)
                VALUES (:nombre, :paterno, :materno, :ci, :celular, :genero, :fn, :zona, :calle, :nro)
                RETURNING id_persona
            """)
            res = db.session.execute(persona_sql, {
                "nombre": data["nombre"],
                "paterno": data["paterno"],
                "materno": data.get("materno", ""),
                "ci": data["ci"],
                "celular": data.get("celular", ""),
                "genero": data.get("genero", ""),
                "fn": data["fecha_nacimiento"],
                "zona": data.get("zona", ""),
                "calle": data.get("barrio", ""),
                "nro": data.get("nro_casa", "")
            })
            id_persona = res.scalar()
            print(f"[INFO] Nueva persona insertada: id_persona={id_persona}, CI={data['ci']}")

        # -------- SINCRONIZAR SECUENCIA DE id_participante --------
        db.session.execute(
            text("SELECT setval('participante_id_participante_seq', (SELECT COALESCE(MAX(id_participante),0) FROM participante))")
        )
        print("[INFO] Secuencia de id_participante sincronizada con el máximo valor actual.")

        # -------- VERIFICAR PARTICIPANTE EXISTENTE --------
        participante_existente = db.session.execute(
            text("SELECT id_participante, matricula FROM participante WHERE id_persona = :idp"),
            {"idp": id_persona}
        ).first()

        if participante_existente:
            matricula_generada = participante_existente[1]
            print(f"[INFO] Participante ya existe: id_participante={participante_existente[0]}, matricula={matricula_generada}")
        else:
            # -------- INSERTAR PARTICIPANTE --------
            participante_sql = text("""
                INSERT INTO participante (id_persona, estado, id_tutor)
                VALUES (:idp, :estado, :idt)
                RETURNING matricula
            """)
            res_part = db.session.execute(participante_sql, {
                "idp": id_persona,
                "estado": data.get("estado", "activo"),
                "idt": id_tutor
            })
            matricula_generada = res_part.scalar()
            print(f"[INFO] Nuevo participante insertado: id_persona={id_persona}, matricula={matricula_generada}")

        db.session.commit()

        return jsonify({
            "ok": True,
            "message": "Participante registrado con éxito",
            "matricula": matricula_generada
        })

    except IntegrityError as ie:
        db.session.rollback()
        print(f"[ERROR] IntegrityError: {ie}")
        return jsonify({"error": "Datos duplicados o inválidos"}), 409
    except Exception as e:
        db.session.rollback()
        print(f"[ERROR] Exception: {e}")
        return jsonify({"error": str(e)}), 500

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

    columnas = [
            {"id": "id_voluntario", "name": "ID"},
            {"id": "nombre_completo", "name": "Nombre Completo"},
            {"id": "correo", "name": "Correo"},
            {"id": "tipo", "name": "Nivel de Educacion"},
    ]
    try:
        query_sql = text("SELECT * FROM voluntarios_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [dict(row) for row in result_proxy.mappings()]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    voluntarios_data = {
        "columns": columnas,
        "data": datos_crudos
    }

    return render_template("voluntarios/index.html", data=voluntarios_data)


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

    columnas = [
            {"id": "id_tutor", "name": "ID"},
            {"id": "nombre_completo", "name": "Nombre Completo"},
            {"id": "parentesco", "name": "Parentesco"},
    ]
 
    try:
        query_sql = text("SELECT * FROM tutores_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [dict(row) for row in result_proxy.mappings()]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []
    
    tutores_data = {
        "columns": columnas,
        "data": datos_crudos
    }

    return render_template("tutores/index.html", data=tutores_data)


# endregion


# region Actividades
@app.route("/cursos_talleres")
def cursos_talleres():
    return render_template("cursos_talleres.html")


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


"""
CREATE OR ALTER VIEW aportes_publico
AS
	SELECT 	a.id_aporte,a.monto_total, a.descripcion, a.f_creacion, a.f_edicion,
    p.nombre||' '||p.paterno::text)||' '||p.materno AS nombre_completo
   	FROM aporte a
	JOIN participante pa ON pa.id_participante = a.id_participante
	JOIN persona p ON p.id_persona = pa.id_persona;
"""
@app.route("/aportes")
def aportes():

    # Definimos las columnas que queremos mostrar
    columnas = [
        {"id": "id_aporte", "name": "ID"},
        {"id": "monto_total", "name": "Monto Total"},
        {"id": "descripcion", "name": "Descripción"},
        {"id": "f_creacion", "name": "Fecha de Creación"},
        {"id": "f_edicion", "name": "Fecha de Edición"},
        {"id": "nombre_completo", "name": "Participante"},
    ]

    try:
        query_sql = text("SELECT * FROM aportes_publico")
        result_proxy = db.session.execute(query_sql)
        datos_crudos = [dict(row) for row in result_proxy.mappings()]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    # Armamos la estructura final
    aportes_data = {
        "columns": columnas,
        "data": datos_crudos
    }

    # Pasamos la estructura al template
    return render_template("aportes/index.html", data=aportes_data)



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
