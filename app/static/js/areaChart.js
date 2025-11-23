const areaData = JSON.parse(document.getElementById("area-data").textContent);
var optionsArea = {
  series: areaData.series,
  chart: {
    height: 400,
    type: "area", // Tipo Área para el relleno
    toolbar: { show: false }, // Ocultar menú de descarga si quieres limpieza
  },
  dataLabels: {
    enabled: false,
  },
  stroke: {
    curve: "smooth", // <--- ESTO hace las líneas curvas suaves
    width: 3,
  },
  xaxis: {
    categories: areaData.categories,
  },
  fill: {
    type: "gradient", // <--- El efecto degradado de tu imagen
    gradient: {
      shadeIntensity: 1,
      opacityFrom: 0.7,
      opacityTo: 0.2,
      stops: [0, 90, 100],
    },
  },
  colors: ["#a29bfe", "#fab1a0"], // Morado y Naranja suave
  tooltip: {
    theme: "dark", // Opcional: estilo del tooltip
  },
};
const chartAreaElement = document.querySelector("#chart-area");
var chartArea = new ApexCharts(chartAreaElement, optionsArea);
setTimeout(function () {
  chartArea.render();
  chartAreaElement.classList.remove("skeleton");
}, 150);
