const { v4: uuidv4 } = require('uuid');

function user (id, username, password, email, google) {
    this.id = id || -1;
    this.username = username || "steve";
    this.password = password || "";
    this.email = email || "";
    this.google = google || "";
}

user.register = async function() {
    if (self.id == -1)
        self.id = uuidv4();
    try {
        await client.query(`INSERT INTO users(id, username, password, email, google) VALUES('${self.id}', '${self.username}', '${self.password}', '${self.email}', '${self.google}')`);
        return self;
    } catch (e) {
        console.error(e);
        return e;
    }
};

user.update = async function() {
    try {
        await client.query(`UPDATE users SET username = '${self.username}', password = '${self.password}', email = '${self.email}', google = '${self.google}' WHERE id = '${self.id}'`);
        return self;
    } catch (e) {
        console.error(e);
        return e;
    }
};

user.find = async function(email) {
    try {
        res = await client.query(`SELECT * FROM users WHERE email = '${email}`);
        if (res.rowCount != 1) {
            throw 'Email invalid';
        }
        self = res.rows.filter(user => {return user});
        return self;
    } catch (e) {
        console.error(e);
        return e;
    }
}

module.exports = user