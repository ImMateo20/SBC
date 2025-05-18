import db from "../config/database.js";

const mostrarDiagnosticos = async (req, res) => {
  try {
    const id = req.session.usuario.id;
    const query = `SELECT * FROM usuarios WHERE id = ${id}`;
    const [usuario] = await db.query(query);

    const [rows] = await db.query(`
        SELECT 
          CONCAT(u.nombre, ' ', u.apellido_paterno) AS nombre,
          e.fecha,
          e.diagnostico,
          e.recomendacion
        FROM evaluaciones e
        INNER JOIN usuarios u ON u.id = e.usuario_id
        ORDER BY e.fecha DESC
      `);

    res.render("admin/listaDiagnosticos", {
      evaluaciones: rows,
      usuario: usuario[0],
    });
  } catch (error) {
    console.error("Error al obtener las evaluaciones:", error);
    res.status(500).send("Error interno del servidor");
  }
};

const mostrarEvaluaciones = async (req, res) => {
  try {
    let usuario = null;
    if (req.session.usuario) {
      const id = req.session.usuario.id;
      const query = `SELECT * FROM usuarios WHERE id = ?`;
      const [resultado] = await db.query(query, [id]);
      usuario = resultado[0];
    }
    res.render("admin/evaluaciones", {
      usuario, 
    });
  } catch (error) {
    console.error("Error al mostrar la pagina de evaluaciones", error);
    res.status(500).send("Error interno");
  }
};

const obtenerEvaluaciones = async (req, res) => {
  try {
    const [rows] = await db.query(`
            SELECT diagnostico, COUNT(*) AS cantidad
            FROM evaluaciones
            GROUP BY diagnostico
        `);
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error al obtener los datos" });
  }
};

export { mostrarDiagnosticos, mostrarEvaluaciones, obtenerEvaluaciones };
