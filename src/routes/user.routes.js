import express from "express";
import { mostrarPerfil } from "../controllers/userController.js";
const router = express.Router();

router.get("/perfil", mostrarPerfil);
export default router;
