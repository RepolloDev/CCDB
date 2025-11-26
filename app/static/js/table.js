// Función para generar slug (sin cambios)
function generateSlug(text) {
  return text
    .toString()
    .toLowerCase()
    .replace(/\s+/g, "-") // Replace spaces with -
    .replace(/[^\w\-]+/g, "") // Remove all non-word chars
    .replace(/\-\-+/g, "-") // Replace multiple - with single -
    .replace(/^-+/, "") // Trim - from start of text
    .replace(/-+$/, ""); // Trim - from end of text
}

// Función para crear la tabla (simplificada: usa data directamente)
function createTable(columns, data, elementId) {
  console.log("Creating table with columns:", columns);
  const tableElement = document.getElementById(elementId);

  // Validaciones
  if (!columns || !Array.isArray(columns)) {
    console.error("Error: 'columns' is undefined or not an array. Cannot create table.");
    return;
  }
  if (!data || !Array.isArray(data)) {
    console.error("Error: 'data' is undefined or not an array. Cannot create table.");
    return;
  }

  // Opcional: Limpiar valores null/undefined en data para evitar errores en sorting
  const cleanedData = data.map(row => {
    if (!row || typeof row !== 'object') {
      console.warn("Warning: Row is not an object:", row);
      return {};
    }
    const cleanedRow = {};
    Object.keys(row).forEach(key => {
      cleanedRow[key] = row[key] ?? ""; // Convierte null/undefined a ""
    });
    return cleanedRow;
  });

  console.log("Cleaned data:", cleanedData);

  // Configurar columnas para Grid.js: usa c.name y c.id
  const gridColumns = columns.map(c => {
    if (!c || !c.name || !c.id) {
      console.warn("Warning: Column is invalid (missing name or id):", c);
      return { name: "Unknown" };
    }
    return { name: c.name, id: c.id }; // 'id' mapea a la key del objeto
  });

  // Crear la tabla
  if (cleanedData.length === 0) {
    console.warn("Warning: No data to display in the table.");
    tableElement.innerHTML = "<p>No data available.</p>";
    return;
  }

  const grid = new gridjs.Grid({
    data: cleanedData,  // Array de objetos directamente
    columns: [
      ...gridColumns,
      {
        name: "Acciones",
        sort: false,
        formatter: (_, row) => {
          // Usa row.id_participante (ajusta si el ID no es este campo)
          return gridjs.html(`
            <button class="btn btn-info" data-id="${row.id_participante}">Editar</button>
            <button class="btn btn-error" data-id="${row.id_participante}">Eliminar</button>
          `);
        },
      },
    ],
    pagination: { enabled: true, limit: 10, summary: true },
    search: { enabled: true },
    sort: true,
  });

  grid.render(tableElement);
}