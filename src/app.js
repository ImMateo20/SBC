import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import multer from "multer";
import db from "./config/database.js";
import session from "express-session";
import MySQLStoreModule from "express-mysql2-session";
import userRoutes from "./routes/user.routes.js";
import loginRoutes from "./routes/login.routes.js";
import signinRoutes from "./routes/signin.routes.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();
const MySQLStore = MySQLStoreModule(session);
const PORT = 4000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.use(express.static(path.join(__dirname, "public")));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(
  session({
    secret: "mateo",
    resave: false,
    saveUninitialized: false,
    store: new MySQLStoreModule({}, db),
  })
);

app.use(indexRoutes);
app.use(loginRoutes);
app.use(signinRoutes);
app.use(userRoutes);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`El servidor esta escuchando en: http://localhost:${PORT}/`);
});
