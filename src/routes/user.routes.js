import express from "express";
import {
  mostrarPagDiagnostico,
  mostrarResultados,
  realizarDiagnosticoSQL,
} from "../controllers/userController.js";
import { estaLogeado } from "../middlewares/authMiddlewares.js";
const router = express.Router();

router.get("/diagnostico", estaLogeado, mostrarPagDiagnostico);
router.post("/diagnostico", estaLogeado, realizarDiagnosticoSQL);
router.get("/resultados", estaLogeado, mostrarResultados);
export default router;
