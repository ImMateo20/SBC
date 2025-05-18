import db from "../config/database.js";
import bcrypt from "bcryptjs";

const mostrarSignin = (req, res) => {
  res.render("auth/signin");
};

const procesarSignin = async (req, res) => {
  try {
    const usuario = req.body;

    const errores = [];
    if (usuario.nombre.length > 50)
      errores.push("El nombre es demasiado largo");
    if (usuario.apellido_paterno.length > 50)
      errores.push("El apellido paterno es demasiado largo");
    if (usuario.apellido_materno.length > 50)
      errores.push("El apellido materno es demasiado largo");
    if (usuario.email.length > 50) errores.push("El correo es demasiado largo");

    const soloLetras = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;

    if (!soloLetras.test(usuario.nombre))
      errores.push("El nombre solo debe contener letras y espacios");
    if (!soloLetras.test(usuario.apellido_paterno))
      errores.push("El apellido paterno solo debe contener letras y espacios");
    if (!soloLetras.test(usuario.apellido_materno))
      errores.push("El apellido materno solo debe contener letras y espacios");

    if (errores.length > 0) {
      return res.status(400).render("auth/signin", {
        message: errores.join(". "),
      });
    }

    const [yaEstaRegistrado] = await db.query(
      `SELECT * FROM usuarios WHERE email = ?`,
      [usuario.email]
    );

    if (yaEstaRegistrado.length > 0) {
      return res.status(400).render("auth/signin", {
        message: "Ya existe un usuario con este correo",
      });
    }

    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(usuario.password, salt);

    const queryRegistro = `
      INSERT INTO usuarios(nombre, apellido_paterno, apellido_materno, email, password)
      VALUES (?, ?, ?, ?, ?)`;

    const [resultado] = await db.query(queryRegistro, [
      usuario.nombre,
      usuario.apellido_paterno,
      usuario.apellido_materno,
      usuario.email,
      hash,
    ]);

    req.session.usuario = { id: resultado.insertId };
    res.redirect("/");
  } catch (error) {
    console.error(`Error en la consulta: `, error);
    res.status(500).send("Error en la consulta");
  }
};

export { mostrarSignin, procesarSignin };
