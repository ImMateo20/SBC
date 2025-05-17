import db from "../config/database.js";
import bcrypt from "bcryptjs";

const mostrarSignin = (req, res) => {
  res.render("auth/signin");
};

const procesarSignin = async (req, res) => {
  try {
    const usuario = req.body;
    console.log(usuario);

    const queryEmail = `SELECT * FROM usuarios WHERE email='${usuario.email}'`;
    const [yaEstaRegistrado] = await db.query(queryEmail);

    // console.log(yaEstaRegistrado)
    if (yaEstaRegistrado.length > 0) {
      return res.status(400).render("auth/signin", {
        message: "Ya existe un usuario con este correo",
      });
    }

    const salt = await bcrypt.genSalt(10); //Generar un patrón
    const hash = await bcrypt.hash(usuario.password, salt); //Se cifra

    // console.log(datos);

    const queryRegistro =
      "INSERT INTO usuarios(nombre,apellido_paterno,apellido_materno,email,password) VALUES (?,?,?,?,?)";

    const [resultado] = await db.query(queryRegistro, [
      usuario.nombre,
      usuario.apellido_paterno,
      usuario.apellido_materno,
      usuario.email,
      hash,
    ]);

    const newId = await resultado.insertId;
    console.log("Nuevo Id = ", newId);

    req.session.usuario = {
      id: newId,
    };

    res.redirect("/");
  } catch (error) {
    console.error(`Error en la consulta: `, error);
    res.status(500).send("Error en la consulta");
  }
};

export { mostrarSignin, procesarSignin };
