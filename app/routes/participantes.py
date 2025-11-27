from flask import Blueprint, render_template, request, jsonify
from sqlalchemy import text
from datetime import date
from ..db import Database
from sqlalchemy.exc import IntegrityError

db = Database.db

participantes_bp = Blueprint("participantes", __name__, url_prefix="/participantes")


@participantes_bp.route("/")
def index():
    try:
        query_sql = text("SELECT * FROM participantes_publico")
        result = db.session.execute(query_sql).mappings()
        datos = [list(r.values()) for r in result]
    except Exception as e:
        print("[ERROR]", e)
        datos = []

    tutores = db.session.execute(text("SELECT * FROM tutores_select")).mappings().all()

    return render_template("participantes/index.html", data=datos, tutores=tutores)


@participantes_bp.post("/create")
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
                    "calle": data.get("calle", ""),
                    "nro": data.get("nro_casa", ""),
                    "idp": id_persona,
                },
            )
            print(
                f"[INFO] Persona actualizada en la tabla persona: id_persona={id_persona}"
            )
        else:
            # -------- INSERTAR NUEVA PERSONA --------
            persona_sql = text("""
                INSERT INTO persona (nombre, paterno, materno, ci, celular, genero, f_nacimiento, zona, calle, nro)
                VALUES (:nombre, :paterno, :materno, :ci, :celular, :genero, :fn, :zona, :calle, :nro)
                RETURNING id_persona
            """)
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
            participante_sql = text("""
                INSERT INTO participante (id_persona, estado, id_tutor)
                VALUES (:idp, :estado, :idt)
                RETURNING matricula
            """)
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
