import { createPool } from "mysql2/promise.js";

const pool = createPool({
  host: "localhost",
  user: "root",
  password: "Bboyissei19",
  database: "proyecto_SBC",
  waitForConnections: true,
  connectionLimit: 10, //CHECAR ESTA PARTE
  queueLimit: 0,
});

export default pool;
