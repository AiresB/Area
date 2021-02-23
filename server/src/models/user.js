const { v4: uuidv4 } = require('uuid');
const { client } = require("../models/index");
const bcrypt = require('bcrypt');


const userCreate = async (user) => {
    user.password = await bcrypt.hash(user.password, 10);
    user.google = "";
    return userRegister(user);
};

const userRegister = async (user) => {
    const id = uuidv4();
    const res = await client.query(`INSERT INTO users(id, username, password, email, google) VALUES('${id}', '${user.username}', '${user.password}', '${user.email}', '${user.google}')`);
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
        await client.query(`UPDATE 'users' SET username = '${user.username}', password = '${user.password}', email = '${user.email}', google = '${user.google}' WHERE id = '${user.id}'`);
        return user;
    } catch (e) {
        console.error(e);
        return e;
    }
};

const userFind = async function(email) {
    try {
        res = await client.query(`SELECT * FROM "users" WHERE "email" = '${email}'`);
        if (res.rowCount != 1) {
            throw 'Email invalid';
        }
        user = res.rows.filter(user => {return user});
        return user[0];
    } catch (e) {
        console.error(e);
        return ;
    }
}

module.exports =  { userRegister, userFind, userUpdate, userCreate }