from flask import request, jsonify, flash, redirect
from sqlalchemy import text


def get_data():
    """Get data from JSON or form."""
    return request.get_json(silent=True) or request.form.to_dict()


def is_ajax():
    """Check if request is AJAX."""
    return (
        request.is_json or request.headers.get("X-Requested-With") == "XMLHttpRequest"
    )


def respond(message=None, success=True, redirect_to=None, status=200):
    """Unified response handler for AJAX and regular requests."""
    if is_ajax():
        return jsonify({"ok": success, "message": message}), status

    if message:
        flash(message, "success" if success else "error")

    return redirect(redirect_to) if redirect_to else None


def query_one(db, sql, params=None):
    """Execute query and return one row as dict."""
    return dict(db.session.execute(text(sql), params or {}).mappings().one())


def query_all(db, sql, params=None):
    """Execute query and return all rows."""
    return db.session.execute(text(sql), params or {}).mappings().all()


def query_values(db, sql, params=None):
    """Execute query and return list of value lists."""
    result = db.session.execute(text(sql), params or {}).mappings()
    return [list(r.values()) for r in result]


def execute(db, sql, params=None):
    """Execute SQL and commit. Returns scalar if RETURNING clause present."""
    result = db.session.execute(text(sql), params or {})
    db.session.commit()
    try:
        return result.scalar()
    except:
        return None
