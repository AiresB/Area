const dotenv = require('dotenv');
dotenv.config();

module.exports = {
    port: process.env.PORT,
    'database': {
        databaseUser: process.env.PGUSER,
        databaseName: process.env.PGDATABASE,
        databasePort: Number(process.env.PGPORT),
        databaseHost: process.env.PGHOST,
        databasePassword: process.env.PGPASSWORD
    }
};