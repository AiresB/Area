const { v4: uuidv4 } = require('uuid');
const { client } = require("../models/index");

const areaRegister = async (area) => {
    const id = uuidv4();
    const res = await client.query(`INSERT INTO area(id, user_id, action_id, actions_desc, reaction_id, reaction_desc) VALUES('${id}', '${area.userId}', '${area.actionId}', '${area.actionDesc}', '${area.reactionId}', '${area.reactionDesc}')`);
    return {
        id: id,
        userId: area.userId,
        actionId: area.actionId,
        actionDesc: area.actionDesc,
        reactionId: area.reactionId,
        reactionDesc: area.reactionDesc,
    }
};

const areaDelete = async (id) => {
    const res = await client.query(`DELETE FROM area WHERE id = '${id}' RETURNING *`);
    return res
};

const areaUpdate = async function(area) {
    try {
        await client.query(`UPDATE area SET user_id = '${area.userId}', action_id = '${area.actionId}', action_desc = '${area.actionDesc}', action_id = '${area.reactionId}', action_desc = '${area.reactionDesc}' WHERE id = '${area.id}'`);
        return area;
    } catch (e) {
        console.error(e);
        return e;
    }
};

const areaFind = async function(type, search) {
    try {
        res = await client.query(`SELECT * FROM "area" WHERE "'${type}'" = '${search}'`);
        area = res.rows.filter(area => {return area});
        return area;
    } catch (e) {
        return ;
    }
}

module.exports =  { areaRegister, areaFind, areaUpdate, areaDelete}