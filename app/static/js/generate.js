function generateTable(cols) {
  const jsonDataElement = document.getElementById("data");
  const rawData = JSON.parse(jsonDataElement.textContent);

  const grid = new gridjs.Grid({
    columns: cols,
    data: rawData.map((row) => [
      ...row,
      gridjs.html(`
          <div class="flex gap-2">
            <button class="btn btn-info" data-id="${row[0]}" data-ref="${typeof APORTE_EDIT_URL_TEMPLATE !== 'undefined' ? APORTE_EDIT_URL_TEMPLATE.replace('__ID__', row[0]) : ''}">Editar</button>
            <button class="btn btn-error" data-id="${row[0]}" data-ref="${typeof APORTE_DELETE_URL_TEMPLATE !== 'undefined' ? APORTE_DELETE_URL_TEMPLATE.replace('__ID__', row[0]) : ''}">Eliminar</button>
          </div>
        `),
    ]),
    search: true,
    pagination: { enabled: true, limit: 10 },
  });
  grid.render(document.getElementById("table-data"));
}
