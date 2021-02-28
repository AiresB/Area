/*  Lib Import   */
const express = require('express');
const bodyParser = require('body-parser')

/*  Modules Import  */
const routes = require("./routes/index");
const { initDb } = require("./models/index");
const {hoock} = require("./area/hoocker")

/*  Code    */
const app = express();

const main = async () => {
    app.use(bodyParser.json());

    app.use("/", routes);

    await new Promise(r => setTimeout(r, 2000));

    await initDb().then();

    app.listen(process.env.PORT, () => console.log(`server start http://localhost:${process.env.PORT}`));

    hoock();
}

main()
