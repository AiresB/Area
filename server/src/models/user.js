const { v4: uuidv4 } = require('uuid');
const { client } = require("../models/index");

const userRegister = async (user) => {
    const id = uuidv4();
    const res = await client.query(`INSERT INTO users(id, username, password, email, google) VALUES('${id}', '${user.username}', '${user.hash}', '${user.email}', '${JSON.stringify(user.google)}')`);
    //to do confirmation mail
    return {
        id: id,
        username: user.username,
        email: user.email,
        google: user.google,
    }
};

const userUpdate = async function(user) {
    try {
        await client.query(`UPDATE users SET username = '${user.username}', email = '${user.email}', google = '${JSON.stringify(user.google)}' WHERE id = '${user.id}'`);
        return user;
    } catch (e) {
        console.error(e);
        return e;
    }
};

const userUpdateMob = async function(user) {
    try {
        await client.query(`UPDATE users SET username = '${user.username}', email = '${user.email}', google = '${user.google}' WHERE id = '${user.id}'`);
        return user;
    } catch (e) {
        console.error(e);
        return e;
    }
};

const userFind = async function(type, search) {
    try {
        res = await client.query(`SELECT * FROM "users" WHERE "${type}" = '${search}'`);
        if (res.rowCount != 1) {
            throw 'Email invalid';
        }
        user = res.rows.filter(user => {return user});
        return user[0];
    } catch (e) {
        return ;
    }
}

module.exports =  { userRegister, userFind, userUpdate, userUpdateMob}