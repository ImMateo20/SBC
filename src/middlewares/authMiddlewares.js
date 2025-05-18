import db from "../config/database.js";
const estaLogeado = (req, res, next) => {
  if (req.session.usuario) {
    return next();
  }

  return res.redirect("/auth/login");
};

const noEstaLogeado = (req, res, next) => {
  if (!req.session.usuario) {
    return next();
  }

  return res.redirect("/");
};

const esAdmin = async (req, res, next) => {
  const id = req.session.usuario.id;
  const query = `SELECT * FROM usuarios WHERE id = ${id}`;
  const [usuario] = await db.query(query);
  if (usuario[0].rol == "admin") {
    return next();
  }

  return res.redirect("/");
};

const noEsAdmin = async (req, res, next) => {
  const id = req.session.usuario.id;
  const query = `SELECT * FROM usuarios WHERE id = ${id}`;
  const [usuario] = await db.query(query);
  if (!usuario[0].rol == "admin") {
    return next();
  }

  return res.redirect("/");
};

export { estaLogeado, noEstaLogeado, esAdmin, noEsAdmin };
