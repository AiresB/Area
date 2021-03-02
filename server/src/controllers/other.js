const services = require('../area/services');


exports.about = async (req, res) => {
    const ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    const time = Date.now();
    const client = {host: ip};
    const serveur = {current_time: time, services: services}
    res.status(200).json({client: client, serveur: serveur});
}

exports.apk = async (req, res) => {
    res.send("Coming soon")
}