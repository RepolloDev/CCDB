# MODELOS DE LA APLICACIÓN
from ..db import Database
from sqlalchemy import text

db = Database.db


class CursoTaller:
    @classmethod
    def get_view(cls):
        cols = [
            {"id": "id", "name": "ID"},
            {"id": "nombre", "name": "Nombre"},
            {"id": "voluntario", "name": "Voluntario"},
            {"id": "salon", "name": "Salón"},
        ]
        with db.session() as session:
            query_sql = text("select * from curso_taller_publico;")
            result_proxy = session.execute(query_sql)
        data = {"cols": cols, "rows": [dict(row) for row in result_proxy.mappings()]}
        return data

    @classmethod
    def count_all(cls) -> int:
        with db.session() as session:
            query_sql = text("select count(*) as total from curso_taller;")
            result_proxy = session.execute(query_sql)
            total = result_proxy.mappings().first()["total"]
        return total

    @classmethod
    def get_by_id(cls, id: int):
        with db.session() as session:
            query_sql = text("select * from curso_taller where id_curtal = :id;")
            result_proxy = session.execute(query_sql, {"id": id})
            curso_taller = result_proxy.mappings().first()
        return dict(curso_taller) if curso_taller else None

    @classmethod
    def update(cls, id: int, form_data):
        with db.session() as session:
            query_sql = text("""
            """)
            session.execute(
                query_sql,
                {
                    "id": id,
                    "nombre": form_data["nombre"],
                    "descripcion": form_data["descripcion"],
                    "voluntario": form_data["voluntario"],
                    "salon": form_data["salon"],
                    "fecha_inicio": form_data["fecha_inicio"],
                    "fecha_fin": form_data["fecha_fin"],
                },
            )
            session.commit()
