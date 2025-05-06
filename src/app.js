import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import multer from "multer";
import indexRoutes from "./routes/index.routes.js";

const app = express();
const PORT = 4000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.use(express.static(path.join(__dirname, "public")));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(indexRoutes);

app.listen(PORT, () => {
  console.log(`El servidor esta escuchando en: http://localhost:${PORT}/`);
});
