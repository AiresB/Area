const { v4: uuidv4 } = require('uuid');
const { client } = require("../models/index");


userRegister = async function(user) {
    if (user.id == -1 || user.id == null)
        user.id = uuidv4();
    try {
        console.log("try")
        console.log(await client.query('SELECT * FROM "users"'))
        await client.query(`INSERT INTO users(id, username, password, email, google) VALUES('${user.id}', '${user.username}', '${user.password}', '${user.email}', '${user.google}')`);
        console.log("works")
        return user;
    } catch (e) {
        console.log("failed")
        console.error(e);
        return e;
    }
};

userUpdate = async function(user) {
    try {
        await client.query(`UPDATE users SET username = '${user.username}', password = '${user.password}', email = '${user.email}', google = '${user.google}' WHERE id = '${user.id}'`);
        return user;
    } catch (e) {
        console.error(e);
        return e;
    }
};

userFind = async function(user, email) {
    try {
        res = await client.query(`SELECT * FROM users WHERE email = '${email}`);
        if (res.rowCount != 1) {
            throw 'Email invalid';
        }
        user = res.rows.filter(user => {return user});
        return user;
    } catch (e) {
        console.error(e);
        return e;
    }
}

module.exports =  userRegister, userFind, userUpdate