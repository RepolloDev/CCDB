from ..db import Database
from flask import Blueprint, render_template, request, jsonify, flash, redirect, url_for
from sqlalchemy import text

db = Database.db


aportes_bp = Blueprint("aportes", __name__, url_prefix="/aportes")


@aportes_bp.route("/")
def aportes():
    try:
        query_sql = text("select * from aportes_publico order by id_aporte")
        result = db.session.execute(query_sql).mappings()
        datos_crudos = [list(r.values()) for r in result]
    except Exception as e:
        print("Error en la consulta:", e)
        datos_crudos = []

    # Pasamos la estructura al template
    return render_template("aportes/index.html", data=datos_crudos)


@aportes_bp.route("/crear", methods=["GET", "POST"])
def crear():
    # GET -> render form
    if request.method == "GET":
        try:
            query_sql = text("select * from opt_participante_public")
            result = db.session.execute(query_sql)
            participantes = result.mappings().all()
        except Exception as e:
            print("Error en la consulta:", e)
            participantes = []
        return render_template(
            "aportes/form.html", participantes=participantes, aporte=None
        )
    # POST -> create aporte (accept JSON or form-encoded data)
    data = request.get_json(silent=True) or request.form.to_dict()

    # Validaciones básicas
    required = ["monto_total", "descripcion", "id_participante"]
    for field in required:
        val = data.get(field)
        if val is None or str(val).strip() == "":
            return jsonify({"error": f"El campo {field} es obligatorio"}), 400

    try:
        insert_sql = text(
            """
            INSERT INTO aporte (monto_total, descripcion, id_participante)
            VALUES (:monto_total, :descripcion, :id_participante)
            RETURNING id_aporte
            """
        )

        # Normalizar tipos
        try:
            monto_val = (
                float(data["monto_total"])
                if data.get("monto_total") is not None
                else 0.0
            )
        except ValueError:
            return jsonify({"error": "monto_total debe ser un número"}), 400

        try:
            id_part = int(data["id_participante"])
        except ValueError:
            return jsonify({"error": "id_participante inválido"}), 400

        db.session.execute(
            insert_sql,
            {
                "monto_total": monto_val,
                "descripcion": data["descripcion"],
                "id_participante": id_part,
            },
        )

        db.session.commit()

        # Otherwise use flash + redirect for classic form submits
        flash("Aporte creado correctamente", "success")
        return redirect(url_for("aportes.aportes"))
    except Exception as e:
        db.session.rollback()
        print("Error creando aporte:", e)
        # For form submits, flash error and redirect back to form
        flash(f"Error creando aporte: {e}", "error")
        return redirect(url_for("aportes.crear_aporte"))


@aportes_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    # GET -> render form with aporte data
    if request.method == "GET":
        try:
            sql_aporte = text("SELECT * FROM aporte WHERE id_aporte = :id")
            res = db.session.execute(sql_aporte, {"id": id}).mappings().one_or_none()
            if not res:
                flash("Aporte no encontrado", "error")
                return redirect(url_for("aportes.aportes"))
            aporte = dict(res)

            query_sql = text("select * from opt_participante_public")
            result = db.session.execute(query_sql)
            participantes = result.mappings().all()
        except Exception as e:
            print("Error obteniendo aporte/participantes:", e)
            flash("Error cargando datos", "error")
            return redirect(url_for("aportes.aportes"))

        return render_template("aportes/form.html", participantes=participantes, aporte=aporte)

    # POST -> update aporte
    data = request.get_json(silent=True) or request.form.to_dict()

    required = ["monto_total", "descripcion", "id_participante"]
    for field in required:
        val = data.get(field)
        if val is None or str(val).strip() == "":
            return jsonify({"error": f"El campo {field} es obligatorio"}), 400

    try:
        # normalize types
        try:
            monto_val = float(data["monto_total"]) if data.get("monto_total") is not None else 0.0
        except ValueError:
            return jsonify({"error": "monto_total debe ser un número"}), 400

        try:
            id_part = int(data["id_participante"])
        except ValueError:
            return jsonify({"error": "id_participante inválido"}), 400

        update_sql = text(
            """
            UPDATE aporte
            SET monto_total = :monto_total,
                descripcion = :descripcion,
                id_participante = :id_participante,
                f_edicion = now()
            WHERE id_aporte = :id
            RETURNING id_aporte
            """
        )

        db.session.execute(
            update_sql,
            {
                "monto_total": monto_val,
                "descripcion": data["descripcion"],
                "id_participante": id_part,
                "id": id,
            },
        )

        db.session.commit()

        flash("Aporte actualizado correctamente", "success")
        return redirect(url_for("aportes.aportes"))
    except Exception as e:
        db.session.rollback()
        print("Error actualizando aporte:", e)
        flash(f"Error actualizando aporte: {e}", "error")
        return redirect(url_for("aportes.editar", id=id))


@aportes_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    # GET -> show confirmation page
    if request.method == "GET":
        try:
            sql = text("SELECT * FROM aportes_publico WHERE id_aporte = :id")
            row = db.session.execute(sql, {"id": id}).mappings().one_or_none()
            if not row:
                flash("Aporte no encontrado", "error")
                return redirect(url_for("aportes.aportes"))
            aporte = dict(row)
        except Exception as e:
            print("Error consultando aporte para eliminar:", e)
            flash("Error cargando datos", "error")
            return redirect(url_for("aportes.aportes"))

        return render_template("aportes/delete.html", aporte=aporte)

    # POST -> perform delete
    try:
        delete_sql = text("DELETE FROM aporte WHERE id_aporte = :id RETURNING id_aporte")
        res = db.session.execute(delete_sql, {"id": id})
        deleted = res.scalar()
        if not deleted:
            db.session.rollback()
            if request.is_json or request.headers.get("X-Requested-With") == "XMLHttpRequest":
                return jsonify({"error": "Aporte no encontrado"}), 404
            flash("Aporte no encontrado", "error")
            return redirect(url_for("aportes.aportes"))

        db.session.commit()

        if request.is_json or request.headers.get("X-Requested-With") == "XMLHttpRequest":
            return jsonify({"ok": True, "id_aporte": deleted}), 200

        flash("Aporte eliminado correctamente", "success")
        return redirect(url_for("aportes.aportes"))
    except Exception as e:
        db.session.rollback()
        print("Error eliminando aporte:", e)
        if request.is_json or request.headers.get("X-Requested-With") == "XMLHttpRequest":
            return jsonify({"error": str(e)}), 500
        flash(f"Error eliminando aporte: {e}", "error")
        return redirect(url_for("aportes.aportes"))
