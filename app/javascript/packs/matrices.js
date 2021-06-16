window.addEventListener("load", onLoad);

function onLoad() {
  loadSkills().then(createChart);
}

function loadSkills() {
  return fetch("skills.json").then((res) => res.json());
}

function createChart(skills = []) {
  return new Chart(document.getElementById("chart").getContext("2d"), {
    type: "radar",
    data: {
      labels: labels(skills),
      datasets: [
        {
          label: "Skills",
          data: data(skills),
          fill: true,
          backgroundColor: "rgba(54, 162, 235, 0.2)",
          borderColor: "rgb(54, 162, 235)",
          pointBackgroundColor: "rgb(54, 162, 235)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgb(54, 162, 235)",
        },
      ],
    },
    options: {
      elements: {
        line: {
          borderWidth: 3,
        },
      },
      scales: {
        r: {
          suggestedMin: 0,
        },
      },
    },
  });
}

function labels(skills = []) {
  return skills.map((it) => it.name);
}

function data(skills = []) {
  return skills.map((it) => sum(it.developer_skills));
}

function sum(developer_skills) {
  return developer_skills.map((it) => it.points).reduce((acc, c) => acc + c, 0);
}
