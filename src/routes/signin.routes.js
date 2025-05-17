import express from "express";
import {
  mostrarSignin,
  procesarSignin,
} from "../controllers/signinController.js";
import { noEstaLogeado } from "../middlewares/authMiddlewares.js";
const router = express.Router();

router.get("/signin", noEstaLogeado, mostrarSignin);

router.post("/signin", noEstaLogeado, procesarSignin);

export default router;
