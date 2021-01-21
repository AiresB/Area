const actionreaction = {
    "action": 1
}

function user (id, username, password, email, google, area) {
    this.id = id || -1;
    this.username = username || "steve";
    this.password = password || "";
    this.email = email || "";
    this.google = google || "";
    this.area = area || [];
}

function area (id, user_id, a_id, a_desc, rea_id, rea_desc) {
    this.id = id || -1;
    this.user_id = user_id || -1;
    this.a_id = a_id || -1;
    this.a_desc = a_desc || "";
    this.rea_id = rea_id || -1;
    this.rea_desc = rea_desc || "";
}