from flask import Flask, render_template

app = Flask(__name__)


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


@app.route("/participantes")
def participantes():
    participantes_data = {
        "columns": [
            {
                "id": "ID",
                "name": "ID",
            },
            {
                "id": "Nombre",
                "name": "Nombre",
            },
            {
                "id": "Edad",
                "name": "Edad",
            },
        ],
        "data": [
            {"ID": 1, "Nombre": "Juan Perez", "Edad": 25},
            {"ID": 2, "Nombre": "Maria Gomez", "Edad": 30},
            {"ID": 3, "Nombre": "Luis Rodriguez", "Edad": 22},
        ],
    }
    return render_template("participantes.html", data=participantes_data)


@app.route("/voluntarios")
def voluntarios():
    return render_template("voluntarios.html")


@app.route("/tutores")
def tutores():
    return render_template("tutores.html")


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


@app.route("/aportes")
def aportes():
    return render_template("aportes.html")


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
