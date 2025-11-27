const container = document.getElementById("content-container");

function openModal() {
  modal.showModal();
}

function updateIframeSrc(url) {
  const iframe = document.getElementById("modal-iframe");
  if (iframe) {
    iframe.src = url;
  } else {
    console.error("Iframe with ID 'modal-iframe' not found.");
  }
}

function addItem() {
  openModal();
  const url = `${BASE_URL}/form?method=add`;
  updateIframeSrc(url);
}
function editItem(id) {
  openModal();
  const url = `${BASE_URL}/form?method=edit&id=${id}`;
  updateIframeSrc(url);
}
function deleteItem(id) {
  openModal();
  const url = `${BASE_URL}/form?method=delete&id=${id}`;
  updateIframeSrc(url);
}

container.addEventListener("click", function (event) {
  const target = event.target.closest("[data-action]");

  if (!target) return;

  const { id, action } = target.dataset;
  switch (action) {
    case "add":
      addItem();
      break;
    case "edit":
      editItem(id);
      break;
    case "delete":
      deleteItem(id);
      break;
    default:
      console.warn(`Unknown action: ${action}`);
  }
});
