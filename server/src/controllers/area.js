const bcrypt = require('bcrypt');
const { stringify } = require('uuid');

const { areaRegister, areaFind, areaUpdate, areaDelete } = require("../models/area");

exports.create = (req, res) => {
    const { userId, actionId, actionDesc, reactionId, reactionDesc} = req.body;

    if (!userId || !actionId || !actionDesc || !reactionId|| !reactionDesc) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }
    const area = await areaRegister({userId, actionId, actionDesc, reactionId, reactionDesc})
    if (!area) {
        res.status(500).json({
            error: true,
            message: "Error serveur, area creation failed"
        });
    } else {
        res.status(201).json({
            error: false,
            area: area
        });
    }
}

exports.delete = (req, res) => {
    const {id} = req.body;

    if (!id) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }
    const deleted = await areaDelete(id)
    if (!deleted) {
    //if (!deleted) { replace by id is the same
        res.status(500).json({
            error: true,
            message: "Error serveur, couldnt delete item"
        });
    } else {
        res.status(200).json({
            error: false,
            deleted: deleted
        });
    }
}

exports.update = (req, res) => {
    const { id, userId, actionId, actionDesc, reactionId, reactionDesc} = req.body;

    if (!id || !userId || !actionId || !actionDesc || !reactionId|| !reactionDesc) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }
    const area = await areaUpdate({id, userId, actionId, actionDesc, reactionId, reactionDesc})
    if (!area) {
        res.status(500).json({
            error: true,
            message: "Error serveur, area creation failed"
        });
    } else {
        res.status(200).json({
            error: false,
            area: area
        });
    }
}

exports.getbyid = (req, res) => {
    const {userId} = req.body;
    if ( !userId ) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }
    const areas = await areaFind("user_id", userId)
    if (!areas) {
        res.status(500).json({
            error: true,
            message: "No area find"
        });
    } else {
        res.status(200).json({
            error: false,
            areas: areas
        });
    }
}