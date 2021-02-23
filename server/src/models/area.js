const actionreaction = {
    "action": 1
}

function area (id, user_id, a_id, a_desc, rea_id, rea_desc) {
    this.id = id || -1;
    this.user_id = user_id || -1;
    this.a_id = a_id || -1;
    this.a_desc = a_desc || "";
    this.rea_id = rea_id || -1;
    this.rea_desc = rea_desc || "";
}

module.exports = actionreaction, area