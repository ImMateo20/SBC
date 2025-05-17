import db from "../config/database.js";
import bcrypt from "bcryptjs";

const mostrarLogin = (req, res) => {
  res.render("auth/login");
};

const procesarLogin = async (req, res) => {
  const { email, password } = req.body;
  // console.log(req.body);
  const queryUsuario = `SELECT * FROM usuarios WHERE email='${email}'`;
  const [resultado] = await db.query(queryUsuario);

  if (resultado.length < 1) {
    return res.status(400).render("auth/login", {
      message: "Usuario no registrado, por favor registrese",
    });
  }

  // console.log(resultado[0].contrasena);

  const esValida = await bcrypt.compare(password, resultado[0].password);
  // console.log(resultado);
  // console.log(esValida);

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
    res.redirect("/");
  });
};

export { mostrarLogin, procesarLogin, cerrarSesion };
