import db from "../config/database.js";

const mostrarPagDiagnostico = async (req, res) => {
  try {
    const id = req.session.usuario.id;

    const [usuario] = await db.query(`SELECT * FROM usuarios WHERE id = ?`, [
      id,
    ]);

    const [evaluaciones] = await db.query(
      `SELECT 1 FROM evaluaciones WHERE usuario_id = ? LIMIT 1`,
      [id]
    );

    const yaEvaluado = evaluaciones.length > 0;

    if (yaEvaluado) {
      return res.redirect("/user/resultados");
    }

    res.render("user/diagnostico", {
      usuario: usuario[0],
    });
  } catch (error) {
    console.error("Error al mostrar la página de diagnóstico", error);
    res.status(500).send("Error interno del servidor");
  }
};

const realizarDiagnosticoSQL = async (req, res) => {
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

    const condiciones = Object.entries(respuestas)
      .map(
        ([clave, valor]) =>
          `(c.atributo = ${db.escape(clave)} AND c.valor = ${db.escape(valor)})`
      )
      .join(" OR ");

    const consulta = `
      SELECT 
        c.regla_id,
        COUNT(*) AS coincidencias,
        r.diagnostico,
        r.recomendacion
      FROM condiciones c
      JOIN reglas r ON c.regla_id = r.id
      WHERE ${condiciones}
      GROUP BY c.regla_id
      ORDER BY coincidencias DESC
      LIMIT 1
    `;

    const [resultadoConsulta] = await db.query(consulta);

    if (resultadoConsulta.length === 0) {
      return res.status(404).send("No se encontró una regla coincidente.");
    }

    const resultado = resultadoConsulta[0];
    const id = req.session.usuario.id;

    const [evaluaciones] = await db.query(
      `SELECT * FROM evaluaciones WHERE usuario_id = ?`,
      [id]
    );

    if (evaluaciones.length === 0) {
      await db.query(
        `INSERT INTO evaluaciones (usuario_id, diagnostico, recomendacion) VALUES (?, ?, ?)`,
        [id, resultado.diagnostico, resultado.recomendacion]
      );
    }

    return res.redirect("/user/resultados");
  } catch (error) {
    console.error("Error al procesar el diagnóstico:", error);
    res.status(500).send("Ocurrió un error al procesar el diagnóstico.");
  }
};

const mostrarResultados = async (req, res) => {
  try {
    const id = req.session.usuario.id;

    const [[evaluacion]] = await db.query(
      `
      SELECT e.diagnostico, r.recomendacion, r.informacion, r.imagen
      FROM evaluaciones e
      JOIN reglas r ON e.diagnostico = r.diagnostico
      WHERE e.usuario_id = ?
      LIMIT 1
    `,
      [id]
    );

    if (!evaluacion) {
      return res.redirect("/user/diagnostico");
    }

    const [[usuario]] = await db.query(`SELECT * FROM usuarios WHERE id = ?`, [
      id,
    ]);

    res.render("user/resultado", {
      diagnostico: evaluacion,
      usuario: usuario,
    });
  } catch (error) {
    console.error("Error al mostrar el resultado:", error);
    res.status(500).send("Error interno del servidor");
  }
};

export { mostrarPagDiagnostico, realizarDiagnosticoSQL, mostrarResultados };
