const mysql = require("mysql2/promise");

let pool;

async function getPool() {
  if (pool) return pool;

  pool = mysql.createPool({
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    socketPath: `/cloudsql/${process.env.CLOUD_SQL_CONNECTION_NAME}`,
    waitForConnections: true,
    connectionLimit: 5,
  });

  return pool;
}

module.exports = getPool;
