const donutData = JSON.parse(document.getElementById("donut-data").textContent);

var optionsDonut = {
  series: donutData.series,
  labels: donutData.labels,
  chart: {
    type: "donut",
    height: 300,
  },
  plotOptions: {
    pie: {
      donut: {
        size: "75%", // Grosor del anillo
        labels: {
          show: true,
          total: {
            show: true,
            label: "Transacciones",
            formatter: function (w) {
              // Muestra la suma total o un valor específico
              return w.globals.seriesTotals[0] + "%";
            },
          },
        },
      },
    },
  },
  stroke: {
    lineCap: "round", // <--- ESTO hace los bordes redondeados como tu imagen
  },
  colors: ["#6c5ce7", "#ffeaa7", "#ff7675"], // Colores similares a tu imagen
  legend: {
    position: "bottom",
  },
};
const chartDonutElement = document.querySelector("#chart-donut");
var chart = new ApexCharts(chartDonutElement, optionsDonut);
setTimeout(function () {
  chart.render();
  chartDonutElement.classList.remove("skeleton");
}, 150);
