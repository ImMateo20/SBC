import express from "express";
import { obtenerEvaluaciones } from "../controllers/adminController.js";
import { esAdmin, estaLogeado } from "../middlewares/authMiddlewares.js";
import { mostrarEvaluaciones } from "../controllers/adminController.js";
import { mostrarDiagnosticos } from "../controllers/adminController.js";
const router = express.Router();

router.get("/evaluaciones", estaLogeado, esAdmin, mostrarEvaluaciones);
router.get("/obtener-evaluaciones", obtenerEvaluaciones);
router.get("/lista-diagnosticos", estaLogeado, esAdmin, mostrarDiagnosticos);

export default router;
