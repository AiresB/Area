const express = require('express');

const app = express();

app.use((req, res, next) => {
    console.log("recu");
    next();
});

app.use((req, res, next) => {
    res.status(201);
    next();
});

app.use((req, res, next) => {
    res.json({ message: 'ok'});
});

module.exports = app;