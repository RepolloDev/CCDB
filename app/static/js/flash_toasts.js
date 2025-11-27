// flash_toasts.js
// Reads flashed messages rendered into the DOM as JSON and shows toasts.
// Prefers solid-toast if available, otherwise falls back to a minimal DOM toast.

document.addEventListener("DOMContentLoaded", function () {
  const messagesEl = document.getElementById("flashed-messages");
  let messages = [];

  try {
    if (messagesEl && messagesEl.textContent) {
      messages = JSON.parse(messagesEl.textContent);
    }
  } catch (e) {
    // parsing error - nothing to show
    console.error("Error parsing flashed messages JSON", e);
    messages = [];
  }

  function fallbackToast(message, type) {
    let container = document.getElementById("toast-container");
    if (!container) {
      container = document.createElement("div");
      container.id = "toast-container";
      container.className =
        "fixed bottom-4 right-4 z-50 flex flex-col gap-2 items-end";
      document.body.appendChild(container);
    }
    const toastEl = document.createElement("div");
    const bg = type === "error" ? "bg-red-600" : "bg-green-600";
    toastEl.className =
      bg + " text-white px-4 py-2 rounded shadow-lg max-w-xs break-words";
    toastEl.textContent = message;
    container.appendChild(toastEl);
    setTimeout(() => {
      toastEl.remove();
    }, 3500);
  }

  function showToast(message, type) {
    try {
      if (typeof toast !== "undefined") {
        // solid-toast exposes toast, with .success and .error helpers
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
      // fall back to DOM implementation
    }

    fallbackToast(message, type);
  }

  if (Array.isArray(messages) && messages.length) {
    messages.forEach(function (m) {
      const category = Array.isArray(m) ? m[0] || "info" : "info";
      const text = Array.isArray(m) ? m[1] || "" : String(m);
      showToast(text, category);
    });
  }
});
