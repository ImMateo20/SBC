import express from "express";
import {
  mostrarInicio,
  mostrarPagDiagnostico,
  realizarDiagnostico,
} from "../controllers/indexController.js";
import { estaLogeado } from "../middlewares/authMiddlewares.js";
const router = express.Router();

router.get("/", mostrarInicio);
router.get("/diagnostico", estaLogeado, mostrarPagDiagnostico);
router.post("/diagnostico", estaLogeado, realizarDiagnostico);

export default router;
