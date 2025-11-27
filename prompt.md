# Guía de Estructura de Módulos CRUD

Este documento describe la estructura estándar para implementar módulos CRUD en la aplicación. Sigue este patrón para mantener consistencia en todo el proyecto.

## Estructura de Archivos por Módulo

Para cada módulo (ejemplo: `aportes`, `participantes`, `voluntarios`):

```
app/
├── routes/
│   └── <modulo>.py          # Archivo de rutas del módulo
├── templates/
│   └── <modulo>/            # Carpeta de templates del módulo
│       ├── index.html       # Página principal con tabla
│       ├── form.html        # Formulario crear/editar
│       └── delete.html      # Confirmación de eliminación
└── utils.py                 # Funciones utilitarias compartidas
```

## Archivo de Rutas (`app/routes/<modulo>.py`)

### Estructura Estándar

```python
from ..db import Database
from ..utils import get_data, respond, query_one, query_all, query_values, execute
from flask import Blueprint, render_template, url_for, request

db = Database.db

<modulo>_bp = Blueprint("<modulo>", __name__, url_prefix="/<modulo>")
```

### Importaciones Requeridas

- `Database` desde `..db` para acceso a la base de datos
- Funciones utilitarias desde `..utils`:
  - `get_data()` - Obtener datos de JSON o formulario
  - `respond()` - Manejar respuestas AJAX o redirecciones
  - `query_one()` - Consultar un registro
  - `query_all()` - Consultar múltiples registros
  - `query_values()` - Consultar como lista de valores
  - `execute()` - Ejecutar SQL con commit
- Flask: `Blueprint`, `render_template`, `url_for`, `request`

### Rutas Estándar (4 rutas por módulo)

#### 1. Ruta Index (Listar)
```python
@<modulo>_bp.route("/")
def index():
    datos = query_values(db, "SELECT * FROM <tabla_vista_publica> ORDER BY <id_campo>")
    return render_template("<modulo>/index.html", data=datos)
```

**Campos a personalizar:**
- `<modulo>` - Nombre del módulo
- `<tabla_vista_publica>` - Nombre de la vista pública de la tabla
- `<id_campo>` - Campo de ordenamiento (normalmente el ID)

#### 2. Ruta Crear
```python
@<modulo>_bp.route("/crear", methods=["GET", "POST"])
def crear():
    if request.method == "GET":
        <dependencias> = query_all(db, "SELECT * FROM <tabla_dependencia>")
        return render_template("<modulo>/form.html", <dependencias>=<dependencias>, <entidad>=None)

    data = get_data()
    execute(db, "INSERT INTO <tabla> (<campos>) VALUES (<placeholders>)", {
        "<param1>": data.get("<campo1>"),
        "<param2>": data.get("<campo2>"),
        # ... más campos
    })
    return respond("<Entidad> creado", redirect_to=url_for("<modulo>.index"), status=201)
```

**Campos a personalizar:**
- `<modulo>` - Nombre del módulo
- `<dependencias>` - Variable con datos relacionados (ej: participantes, niveles)
- `<tabla_dependencia>` - Tabla de la que depende (ej: opt_participante_public)
- `<entidad>` - Nombre singular del recurso (ej: aporte, participante)
- `<tabla>` - Nombre de la tabla principal
- `<campos>` - Lista de campos a insertar
- `<placeholders>` - Placeholders SQL (`:param1, :param2`)
- `<param>` y `<campo>` - Mapeo entre parámetros SQL y campos del formulario

#### 3. Ruta Editar
```python
@<modulo>_bp.route("/editar/<int:id>", methods=["GET", "POST"])
def editar(id):
    if request.method == "GET":
        <entidad> = query_one(db, "SELECT * FROM <tabla> WHERE <id_campo> = :id", {"id": id})
        <dependencias> = query_all(db, "SELECT * FROM <tabla_dependencia>")
        return render_template("<modulo>/form.html", <dependencias>=<dependencias>, <entidad>=<entidad>)

    data = get_data()
    execute(db, "UPDATE <tabla> SET <campo1> = :param1, <campo2> = :param2, f_edicion = now() WHERE <id_campo> = :id", {
        "<param1>": data.get("<campo1>"),
        "<param2>": data.get("<campo2>"),
        # ... más campos
        "id": id,
    })
    return respond("<Entidad> actualizado", redirect_to=url_for("<modulo>.index"))
```

**Campos a personalizar:**
- Similar a crear, más:
- `<id_campo>` - Nombre del campo ID en la tabla

#### 4. Ruta Eliminar
```python
@<modulo>_bp.route("/eliminar/<int:id>", methods=["GET", "POST"])
def eliminar(id):
    if request.method == "GET":
        <entidad> = query_one(db, "SELECT * FROM <tabla_vista> WHERE <id_campo> = :id", {"id": id})
        return render_template("<modulo>/delete.html", <entidad>=<entidad>)

    execute(db, "DELETE FROM <tabla> WHERE <id_campo> = :id", {"id": id})
    return respond("<Entidad> eliminado", redirect_to=url_for("<modulo>.index"))
```

**Campos a personalizar:**
- `<tabla_vista>` - Vista pública para mostrar datos completos
- Resto similar a rutas anteriores

### Estándar de Respuestas

La función `respond()` maneja automáticamente:
- **AJAX/JSON**: Retorna `{"ok": true, "message": "..."}` con status code
- **Formulario**: Ejecuta `flash(message)` y `redirect(url)`

Uso: `respond(message, redirect_to=url_for(...), status=200)`

## Templates

### Estructura de Carpeta `app/templates/<modulo>/`

Tres archivos obligatorios:

#### 1. `index.html` - Página Principal

**Extiende:** `layouts/crudLayout.html`

**Bloques requeridos:**
- `{% block title %}` - Título del módulo
- `{% block content %}` - Estadísticas y tabla
- `{% block scripts %}` - JavaScript y configuración

**Elementos obligatorios en scripts:**
```html
<script id="data" type="application/json">
  {{ data | tojson }}
</script>

<script>
  const EDIT_URL_TEMPLATE = "{{ url_for('<modulo>.editar', id=0).replace('/0','/__ID__') }}";
  const DELETE_URL_TEMPLATE = "{{ url_for('<modulo>.eliminar', id=0).replace('/0','/__ID__') }}";
  const CREATE_URL = "{{ url_for('<modulo>.crear') }}";

  generateTable([
    "ID",
    "<Columna 1>",
    "<Columna 2>",
    // ... columnas según la vista
    "Acciones",
  ]);
</script>
```

**Campos a personalizar:**
- `<modulo>` - Nombre del módulo en url_for
- Nombres de columnas en `generateTable()`
- Contenido de estadísticas (opcional)

#### 2. `form.html` - Formulario Crear/Editar

**Sin layout**, se renderiza en modal o página separada.

**Estructura estándar:**
```html
<form id="form" class="p-2 h-full flex flex-col" 
      action="{% if <entidad> %}{{ url_for('<modulo>.editar', id=<entidad>.<id_campo>) }}{% else %}{{ url_for('<modulo>.crear') }}{% endif %}" 
      method="post">
    
    <h1 class="text-2xl font-semibold mb-4">
        {% if <entidad> %}Editar <Entidad>{% else %}Crear <Entidad>{% endif %}
    </h1>
    
    {% if <entidad> %}
    <input type="hidden" name="<id_campo>" value="{{ <entidad>.<id_campo> }}" />
    {% endif %}

    <div class="grid grid-cols-1 gap-4">
        <!-- Campos del formulario -->
        <div>
            <label class="input w-full">
                <span class="label"><Etiqueta></span>
                <input type="<tipo>" name="<campo>" required value="{{ <entidad>.<campo> if <entidad> else '' }}" />
            </label>
        </div>
        
        <!-- Select para relaciones -->
        <div>
            <label class="select w-full">
                <span class="label"><Etiqueta Relación></span>
                <select name="<id_relacion>" required>
                    <option value="">Seleccione...</option>
                    {% for item in <dependencias> %}
                    <option value="{{ item.<id_dependencia> }}"
                    {% if <entidad> and <entidad>.<id_relacion> == item.<id_dependencia> %}selected{% endif %}>
                        {{ item.<nombre_campo> }}
                    </option>
                    {% endfor %}
                </select>
            </label>
        </div>
    </div>
    
    <div class="btn btn-primary mt-6">
        <button type="submit" class="btn btn-primary w-full">Guardar</button>
    </div>
</form>
```

**Campos a personalizar:**
- `<entidad>` - Nombre singular de la entidad (ej: aporte, participante)
- `<Entidad>` - Nombre capitalizado para títulos
- `<modulo>` - Nombre del módulo
- `<id_campo>` - Campo ID de la entidad
- `<campo>` - Nombre de cada campo del formulario
- `<tipo>` - Tipo de input (text, number, date, email, etc.)
- `<Etiqueta>` - Texto descriptivo del campo
- `<dependencias>` - Variable con datos relacionados
- `<id_relacion>` - Campo FK en la entidad
- `<id_dependencia>` - Campo PK en la tabla relacionada
- `<nombre_campo>` - Campo a mostrar en el select

#### 3. `delete.html` - Confirmación de Eliminación

**Sin layout**.

**Estructura estándar:**
```html
<form method="post" action="{{ url_for('<modulo>.eliminar', id=<entidad>.<id_campo>) }}" class="p-4">
    <h2 class="text-xl font-semibold mb-4">Confirmar eliminación</h2>
    <p class="mb-4">
        ¿Estás seguro que deseas eliminar <descripción del registro>?
    </p>

    <div class="flex justify-center gap-4">
        <a href="{{ url_for('<modulo>.index') }}" class="btn">Cancelar</a>
        <button type="submit" class="btn btn-error">Eliminar</button>
    </div>
</form>
```

**Campos a personalizar:**
- `<modulo>` - Nombre del módulo
- `<entidad>` - Variable con datos de la entidad
- `<id_campo>` - Campo ID
- Descripción del registro (usar campos relevantes de `<entidad>`)

## Funciones Utilitarias (`app/utils.py`)

No requiere personalización. Provee:

- `get_data()` - Obtiene datos del request (JSON o form)
- `is_ajax()` - Detecta si es petición AJAX
- `respond(message, success, redirect_to, status)` - Respuesta unificada
- `query_one(db, sql, params)` - Consulta que retorna un dict
- `query_all(db, sql, params)` - Consulta que retorna lista de mappings
- `query_values(db, sql, params)` - Consulta que retorna lista de listas
- `execute(db, sql, params)` - Ejecuta SQL con commit

## Registro del Blueprint

En `app/__init__.py`, registrar:

```python
from app.routes.<modulo> import <modulo>_bp
app.register_blueprint(<modulo>_bp)
```

## Checklist de Implementación

Para crear un nuevo módulo CRUD:

1. **Base de datos**
   - [ ] Crear tabla en `docker/seeds/1_tablas.sql`
   - [ ] Crear vista pública en `docker/seeds/3_vistas.sql`
   - [ ] Insertar datos de prueba en `docker/seeds/2_datos.sql` (opcional)

2. **Backend**
   - [ ] Crear archivo `app/routes/<modulo>.py`
   - [ ] Definir Blueprint con prefijo `/<modulo>`
   - [ ] Implementar ruta `index()` con query a vista pública
   - [ ] Implementar ruta `crear()` (GET para form, POST para insert)
   - [ ] Implementar ruta `editar(id)` (GET para form, POST para update)
   - [ ] Implementar ruta `eliminar(id)` (GET para confirmación, POST para delete)
   - [ ] Registrar blueprint en `app/__init__.py`

3. **Frontend**
   - [ ] Crear carpeta `app/templates/<modulo>/`
   - [ ] Crear `index.html` con tabla GridJS y constantes de URL
   - [ ] Crear `form.html` con campos apropiados
   - [ ] Crear `delete.html` con confirmación
   - [ ] Verificar que columnas en `generateTable()` coincidan con vista SQL

4. **Personalización**
   - [ ] Reemplazar todos los placeholders `<modulo>`, `<entidad>`, `<tabla>`, etc.
   - [ ] Ajustar campos del formulario según esquema de tabla
   - [ ] Configurar relaciones/selects según dependencias
   - [ ] Personalizar mensajes de éxito/error

## Ejemplo Completo de Mapeo

Para el módulo `aportes`:

| Placeholder | Valor Real |
|-------------|------------|
| `<modulo>` | `aportes` |
| `<entidad>` | `aporte` |
| `<Entidad>` | `Aporte` |
| `<tabla>` | `aporte` |
| `<tabla_vista_publica>` | `aportes_publico` |
| `<id_campo>` | `id_aporte` |
| `<dependencias>` | `participantes` |
| `<tabla_dependencia>` | `opt_participante_public` |
| `<id_relacion>` | `id_participante` |
| Campos principales | `monto_total`, `descripcion`, `id_participante` |

## Notas Importantes

- **Simplicidad**: No agregar validaciones en backend; confiar en constraints DB y validación HTML
- **Consistencia**: Usar siempre las funciones de `utils.py`
- **Nomenclatura**: Singular para entidad, plural para módulo/tabla
- **Vistas SQL**: Crear vistas `<tabla>_publico` con JOINs para mostrar datos legibles
- **Redirecciones**: Siempre usar `url_for('<modulo>.index')` tras create/update/delete
- **AJAX**: La función `respond()` maneja automáticamente JSON vs redirect
- **IDs**: Usar `__ID__` como placeholder en templates JavaScript para reemplazo dinámico
