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
  const grid = new gridjs.Grid({
    data,
    columns: [
      ...columns,
      {
        name: "Acciones",
        sort: false,
        formatter: (cell, row) => {
          return gridjs.html(
            `
                    <button class="btn btn-info" data-id="${row.cells[0].data}">Editar</button>
                    <button class="btn btn-error" data-id="${row.cells[0].data}">Eliminar</button>
                    `
          );
        },
      },
    ],
    autoWidth: true,
    fixedHeader: true,
    pagination: {
      enabled: true,
      limit: 10,
      summary: true,
    },
    search: {
      enabled: true,
    },
    sort: true,
    className: {
      table: "table table-zebra bg-base-100 rounded-xl border border-base-300",
      th: "bg-base-200",
      td: "bg-base-100",
      tr: "hover",
      search: "ml-1 my-4 input input-lg box-border",
      footer: "flex w-full my-4",
      pagination: "join ml-auto",
      paginationSummary: "mx-2 self-center",
      paginationButton: "join-item btn btn-lg box-border",
      paginationButtonCurrent: "btn-accent",
    },
    language: {
      search: {
        placeholder: "🔍 Buscar...",
      },
      pagination: {
        previous: "Anterior",
        next: "Siguiente",
        showing: "Mostrando",
        results: () => "Entradas",
      },
    },
  });

  grid.render(tableElement);
}
