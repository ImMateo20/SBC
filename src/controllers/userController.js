import db from "../config/database.js";

const mostrarPerfil = async (req, res) => {
  try {
    const id = req.session.usuario.id;
    const query = `SELECT * FROM Usuario WHERE id = ${id}`;
    const [resultado] = await db.query(query);
    res.render("user/profile", {
      usuario: resultado[0],
    });
  } catch (error) {}
};

export { mostrarPerfil };
