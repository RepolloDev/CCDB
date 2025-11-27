function generateTable(cols) {
  const jsonDataElement = document.getElementById("data");
  const rawData = JSON.parse(jsonDataElement.textContent);

  // Prefer generic templates provided by the page; fall back to known names for compatibility
  const editTemplate = (typeof EDIT_URL_TEMPLATE !== 'undefined') ? EDIT_URL_TEMPLATE : (typeof APORTE_EDIT_URL_TEMPLATE !== 'undefined' ? APORTE_EDIT_URL_TEMPLATE : (typeof VOL_EDIT_URL_TEMPLATE !== 'undefined' ? VOL_EDIT_URL_TEMPLATE : (typeof PART_EDIT_URL_TEMPLATE !== 'undefined' ? PART_EDIT_URL_TEMPLATE : (typeof ASIG_EDIT_URL_TEMPLATE !== 'undefined' ? ASIG_EDIT_URL_TEMPLATE : ''))));
  const deleteTemplate = (typeof DELETE_URL_TEMPLATE !== 'undefined') ? DELETE_URL_TEMPLATE : (typeof APORTE_DELETE_URL_TEMPLATE !== 'undefined' ? APORTE_DELETE_URL_TEMPLATE : (typeof VOL_DELETE_URL_TEMPLATE !== 'undefined' ? VOL_DELETE_URL_TEMPLATE : (typeof PART_DELETE_URL_TEMPLATE !== 'undefined' ? PART_DELETE_URL_TEMPLATE : (typeof ASIG_DELETE_URL_TEMPLATE !== 'undefined' ? ASIG_DELETE_URL_TEMPLATE : ''))));

  function buildRef(tpl, id) {
    if (!tpl) return '';
    // Support the standard placeholder __ID__ (preferred)
    if (tpl.includes('__ID__')) return tpl.replace(/__ID__/g, id);
    // Fallback: replace the common '/0' placeholder used in templates
    try {
      return tpl.replace('/0', '/' + id);
    } catch (e) {
      return tpl;
    }
  }

  const grid = new gridjs.Grid({
    columns: cols,
    data: rawData.map((row) => [
      ...row,
      gridjs.html(`
        <div class="flex gap-2">
          <button class="btn btn-info" data-id="${row[0]}" data-ref="${buildRef(editTemplate, row[0])}">Editar</button>
          <button class="btn btn-error" data-id="${row[0]}" data-ref="${buildRef(deleteTemplate, row[0])}">Eliminar</button>
        </div>
      `),
    ]),
    search: true,
    pagination: { enabled: true, limit: 10 },
  });
  grid.render(document.getElementById("table-data"));
}
