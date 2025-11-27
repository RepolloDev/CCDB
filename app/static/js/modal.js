const container = document.getElementById("content-container");
const modal = document.getElementById("modal");
const modalContentArea = document.getElementById("modal-content-area");

function openModal() {
  if (modal && typeof modal.showModal === "function") modal.showModal();
}

function closeModal() {
  if (modal && typeof modal.close === "function") modal.close();
}

function showToast(message, type = "success") {
  try {
    if (typeof toast !== "undefined") {
      if (type === "error" && typeof toast.error === "function") {
        toast.error(message);
        return;
      }
      if (type === "success" && typeof toast.success === "function") {
        toast.success(message);
        return;
      }
      if (typeof toast === "function") {
        toast(message);
        return;
      }
    }
  } catch (e) {
    // fall through
  }

  let c = document.getElementById("toast-container");
  if (!c) {
    c = document.createElement("div");
    c.id = "toast-container";
    c.className = "fixed bottom-4 right-4 z-50 flex flex-col gap-2 items-end";
    document.body.appendChild(c);
  }
  const toastEl = document.createElement("div");
  const bg = type === "error" ? "bg-red-600" : "bg-green-600";
  toastEl.className = bg + " text-white px-4 py-2 rounded shadow-lg max-w-xs break-words";
  toastEl.textContent = message;
  c.appendChild(toastEl);
  setTimeout(() => toastEl.remove(), 3500);
}

async function fetchAndInject(url) {
  if (!modalContentArea) return;
  modalContentArea.innerHTML = '<div id="modal-loader" class="py-8 text-center text-sm opacity-60">Cargando formulario...</div>';
  try {
    const res = await fetch(url, { headers: { 'X-Requested-With': 'XMLHttpRequest' } });
    if (!res.ok) {
      modalContentArea.innerHTML = '<div class="py-8 text-center text-sm text-error">No se pudo cargar el formulario.</div>';
      return;
    }
    const html = await res.text();
    modalContentArea.innerHTML = html;

    const form = modalContentArea.querySelector('form');
    if (form) {
      // If the form explicitly opts into AJAX by declaring data-ajax="true",
      // intercept and send it via fetch. Otherwise let the browser perform a
      // normal submit so the whole page navigates (server flash+redirect will work).
      if (form.dataset.ajax === 'true') {
        form.addEventListener('submit', async function (ev) {
          ev.preventDefault();
          const formData = new FormData(form);
          const obj = {};
          for (const [k, v] of formData.entries()) obj[k] = v;

          try {
            const postRes = await fetch(form.action || url, {
              method: (form.method || 'POST').toUpperCase(),
              headers: { 'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest' },
              body: JSON.stringify(obj),
            });

            const contentType = postRes.headers.get('Content-Type') || '';
            if (postRes.ok && contentType.includes('application/json')) {
              const data = await postRes.json();
              if (data && data.ok) {
                closeModal();
                showToast('Guardado correctamente', 'success');
                setTimeout(() => window.location.reload(), 600);
                return;
              }
            }

            if (contentType.includes('text/html')) {
              const text = await postRes.text();
              modalContentArea.innerHTML = text;
              showToast('Revisar el formulario', 'error');
              return;
            }

            showToast('Error al guardar', 'error');
          } catch (err) {
            console.error(err);
            showToast('Error de red al guardar', 'error');
          }
        });
      } else {
        // No AJAX: do not intercept. Let the browser submit the form and
        // follow server redirects on the top-level window.
      }
    }
  } catch (err) {
    console.error(err);
    modalContentArea.innerHTML = '<div class="py-8 text-center text-sm text-error">Error al cargar el formulario.</div>';
  }
}

container.addEventListener("click", function (event) {
  const target = event.target.closest("[data-ref]");

  if (!target) return;

  const { ref } = target.dataset;
  openModal();
  fetchAndInject(ref);
});
