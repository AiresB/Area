/*  Lib Import   */
const express = require('express');
const bodyParser = require('body-parser')

/*  Modules Import  */
const routes = require("./routes/index");
const { port } = require('./config');
const { initDb } = require("./models/index");

/*  Code    */
const app = express();

app.use(bodyParser.json());

app.use("/", routes);

initDb().then();

app.listen(port, () => console.log(`server start http://localhost:${port}`));