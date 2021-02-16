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
    console.log("db init")
    console.log(config.database.databaseUser)
    client.connect(err => {
        if (err) {
          console.error('connection error', err.stack)
        } else {
          console.log('connected')
        }
      })
};

/* Code */


module.exports = { initDb }