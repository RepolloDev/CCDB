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

function createTable(columns, data, elementId) {
  console.log("Creating table with columns:", columns);
  const tableElement = document.getElementById(elementId);

  // Convertimos columnas a objetos { name }
  const gridColumns = columns.map(c => ({ name: c.name }));

  // Transformamos cada objeto en un array ordenado según las columnas
  const gridData = data.map(row =>
    columns.map(c => row[c.id] ?? "")
  );

  console.log("gridColumns:", gridColumns);
  console.log("gridData:", gridData);

  const grid = new gridjs.Grid({
    data: gridData,
    columns: [
      ...gridColumns,
      {
        name: "Acciones",
        sort: false,
        formatter: (_, row) => {
          return gridjs.html(`
            <button class="btn btn-info" data-id="${row.cells[0].data}">Editar</button>
            <button class="btn btn-error" data-id="${row.cells[0].data}">Eliminar</button>
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
