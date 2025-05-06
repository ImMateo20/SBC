import express from "express";
import {
  mostrarInicio,
  mostrarPagDiagnostico,
  realizarDiagnostico,
} from "../controllers/indexController.js";
const router = express.Router();

router.get("/", mostrarInicio);
router.get("/diagnostico", mostrarPagDiagnostico);
router.post("/diagnostico", realizarDiagnostico);

export default router;
