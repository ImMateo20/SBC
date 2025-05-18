import db from "../config/database.js";
import bcrypt from "bcryptjs";

const mostrarLogin = (req, res) => {
  res.render("auth/login");
};

const procesarLogin = async (req, res) => {
  const { email, password } = req.body;
  const queryUsuario = `SELECT * FROM usuarios WHERE email='${email}'`;
  const [resultado] = await db.query(queryUsuario);

  if (resultado.length < 1) {
    return res.status(400).render("auth/login", {
      message: "Usuario no registrado, por favor registrese",
    });
  }


  const esValida = await bcrypt.compare(password, resultado[0].password);

  if (!esValida) {
    return res.status(400).render("auth/login", {
      message: "Contraseña incorrecta",
    });
  }

  req.session.usuario = {
    id: resultado[0].id,
  };
  res.redirect("/");
};

const cerrarSesion = (req, res) => {
  req.session.destroy(() => {
    res.redirect("/auth/login");
  });
};

export { mostrarLogin, procesarLogin, cerrarSesion };
