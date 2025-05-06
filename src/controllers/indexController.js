import axios from "axios";
import evaluarRespuestas from "../utils/reglas.js";

const mostrarInicio = async (req, res) => {
  try {
    res.render("index");
  } catch (error) {
    console.error("Error al mostrar la pagina de inicio", error);
  }
};

const mostrarPagDiagnostico = async (req, res) => {
  try {
    res.render("user/diagnostico");
  } catch (error) {
    console.error("Error al mostrar la pagina de diagnostico", error);
  }
};

const realizarDiagnostico = async (req, res) => {
  try {
    const respuestas = { ...req.body };
    const edad = respuestas.Edad;
    delete respuestas.Edad;

    if ("Peso" in respuestas && "Estatura" in respuestas) {
      if (respuestas.Peso > 0 && respuestas.Estatura > 0) {
        const estatura = respuestas.Estatura / 100;
        const IMC = respuestas.Peso / (estatura * estatura);
        respuestas.IMC =
          IMC < 18.5 ? "0" : IMC < 24.9 ? "1" : IMC < 29.9 ? "2" : "3";
      }
    }
    delete respuestas.Peso;
    delete respuestas.Estatura;

    console.log("La edad es:", edad);
    console.log(respuestas);

    const resultado = evaluarRespuestas(respuestas, parseInt(edad));

    console.log(resultado);

    res.render("user/resultado", {
      diagnostico: resultado,
    });
  } catch (error) {
    console.error("Error al procesar el diagnostico");
  }
};

export { mostrarInicio, mostrarPagDiagnostico, realizarDiagnostico };
