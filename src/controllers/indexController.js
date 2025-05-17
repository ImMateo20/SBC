import axios from "axios";
import db from "../config/database.js";
import evaluarRespuestas from "../utils/reglas.js";

const mostrarInicio = async (req, res) => {
  try {
    if (typeof req.session.usuario === "undefined") {
      // console.log("Entro aqui sin usuario");
      res.render("index");
      return;
    }
    const id = req.session.usuario.id;
    const query = `SELECT * FROM usuarios WHERE id = ${id}`;
    const [resultado] = await db.query(query);

    // console.log("Entro aqui con usuario");
    res.render("index", {
      usuario: resultado[0],
    });
  } catch (error) {
    console.error("Error al mostrar la pagina de inicio", error);
  }
};

const mostrarPagDiagnostico = async (req, res) => {
  try {
    const id = req.session.usuario.id;
    const query = `SELECT * FROM usuarios WHERE id = ${id}`;
    const [usuario] = await db.query(query);

    res.render("user/diagnostico", {
      usuario: usuario[0],
    });
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

    const id = req.session.usuario.id;
    const query = `SELECT * FROM usuarios WHERE id = ${id}`;
    const [usuario] = await db.query(query);

    const queryDiagnostico = `INSERT INTO evaluaciones(usuario_id,diagnostico, recomendacion) VALUES (?,?,?)`;

    await db.query(queryDiagnostico, [
      id,
      resultado.diagnostico,
      resultado.recomendacion,
    ]);

    // console.log("Entro aqui con usuario");
    res.render("user/resultado", {
      diagnostico: resultado,
      usuario: usuario[0],
    });
  } catch (error) {
    console.error("Error al procesar el diagnostico");
  }
};

export { mostrarInicio, mostrarPagDiagnostico, realizarDiagnostico };
