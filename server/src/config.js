'use strict';
require('dotenv').config();

module.exports = {
    'database': {
        databaseUser: process.env.PGUSER,
        databaseName: process.env.PGDATABASE,
        databasePort: Number(process.env.PGPORT),
        databaseHost: process.env.PGHOST,
        databasePassword: process.env.PGPASSWORD
    }
    //'mailauth': {
    //    adress: process.env.MAIL_ADRESS,
    //    password: process.env.MAIL_PASSWORD
    //},
    //'googleauth': {
    //    clientID: process.env.GO_ID_CLIENT,
    //    clientSecret: process.env.GO_CLIENT_SECRET,
    //    callbackURL: process.env.GO_CALLBACK_URL
    //}
};