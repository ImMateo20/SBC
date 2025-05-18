import dotenv from "dotenv";
dotenv.config();

import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import session from "express-session";
import MySQLStoreModule from "express-mysql2-session";
import mysql from "mysql2/promise";
import userRoutes from "./routes/user.routes.js";
import adminRoutes from "./routes/admin.routes.js";
import loginRoutes from "./routes/login.routes.js";
import signinRoutes from "./routes/signin.routes.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();
const MySQLStore = MySQLStoreModule(session);

const PORT = process.env.PORT || 4000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const sessionPool = mysql.createPool({
  host: process.env.MYSQLHOST,
  user: process.env.MYSQLUSER,
  password: process.env.MYSQLPASSWORD,
  database: process.env.MYSQLDATABASE,
  port: process.env.MYSQLPORT,
});

app.use(
  session({
    secret: "mateo",
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore({}, sessionPool),
  })
);

app.use(indexRoutes);
app.use("/auth", loginRoutes);
app.use("/auth", signinRoutes);
app.use("/user", userRoutes);
app.use("/admin", adminRoutes);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`El servidor esta escuchando en: http://localhost:${PORT}/`);
});
