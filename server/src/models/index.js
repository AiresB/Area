/*  Lib Import   */
const { Client } = require('pg');


/*  Modules Import  */
const config = require("../config");


/*  Init    */

const client = new Client({
  host: config.database.databaseHost,
  port: config.database.databasePort,
  user: config.database.databaseUser,
  database: config.database.databaseName,
  password: config.database.databasePassword
});

const initDb = async () => {
  try {
      await client.connect();
  } catch (e) {
      console.error(e);
  }
};

/* Code */


module.exports = { initDb, client }