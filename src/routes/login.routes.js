import express from "express";
import {
  mostrarLogin,
  procesarLogin,
  cerrarSesion,
} from "../controllers/loginController.js";
import { estaLogeado, noEstaLogeado } from "../middlewares/authMiddlewares.js";
const router = express.Router();

router.get("/login", noEstaLogeado, mostrarLogin);

router.post("/login", noEstaLogeado, procesarLogin);

router.get("/logout", estaLogeado, cerrarSesion);

export default router;
