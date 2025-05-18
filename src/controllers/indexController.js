import axios from "axios";
import db from "../config/database.js";

const mostrarInicio = async (req, res) => {
  try {
    if (typeof req.session.usuario === "undefined") {
      res.render("index", {
        yaEvaluado: false,
      });
      return;
    }

    const id = req.session.usuario.id;

    const [resultado] = await db.query(`SELECT * FROM usuarios WHERE id = ?`, [
      id,
    ]);

    const [evaluaciones] = await db.query(
      `SELECT 1 FROM evaluaciones WHERE usuario_id = ? LIMIT 1`,
      [id]
    );
    const yaEvaluado = evaluaciones.length > 0;

    res.render("index", {
      usuario: resultado[0],
      yaEvaluado: yaEvaluado,
    });
  } catch (error) {
    console.error("Error al mostrar la página de inicio", error);
    res.status(500).send("Error interno del servidor");
  }
};

export {
  mostrarInicio
};
