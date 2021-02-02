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
    } catch (e) {
        console.error(e);
    }
};

user.update = async function() {
    try {
        await client.query(`UPDATE users SET username = '${self.username}', password = '${self.password}', email = '${self.email}', google = '${self.google}' WHERE id = '${self.id}'`);
    } catch (e) {
        console.error(e);
    }
};

module.exports = user