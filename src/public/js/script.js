const edad = document.getElementById("input-edad");
const preguntaNino = document.getElementById("preguntas-ninos");

edad.addEventListener("input", () => {
  if (edad.value < 12) {
    if (preguntaNino.style.display == "none") {
      preguntaNino.style.display = "block";
    }
  } else {
    if (preguntaNino.style.display == "block") {
      preguntaNino.style.display = "none";
    }
  }
});

const genero = document.getElementsByName("Genero");
const embarazo = document.getElementById("embarazo");
const embarazoRadios = document.getElementsByName("Embarazo");
const preguntaMujer = document.getElementById("preguntas-mujeres");

genero.forEach((g) => {
  g.addEventListener("change", (e) => {
    if (e.target.checked) {
      if (e.target.value == "1") {
        embarazo.style.display = "block";
        preguntaMujer.style.display = "block";
      } else {
        embarazo.style.display = "none";
        embarazoRadios.forEach((radio) => {
          radio.checked = false;
        });
        preguntaMujer.style.display = "none";
      }
    }
  });
});
