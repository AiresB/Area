const fetch = require("node-fetch");

const holydays = async () => {
    url = 'https://date.nager.at/api/v2/publicholidays/2021/FR'
    const response = await fetch(url)
    const myJson = await response.json();

    var now = new Date()
    if (now.getMonth() < 10) {
        join1 = "-0"
    } else {
        join1 = "-"
    }
    if (now.getDate() < 10) {
        join2 = "-0"
    } else {
        join2 = "-"
    }

    if (now.getMonth() == 0) {
        nowstr = now.getFullYear().toString().concat("-12", join2, now.getDate().toString())
    } else {
        nowstr = now.getFullYear().toString().concat(join1, now.getMonth().toString(), join2, now.getDate().toString())
    }
    console.log(nowstr)

    for (var i = 0; i < myJson.length; i++) {
        if (nowstr.localeCompare(myJson[i].date) == 0) {
            return true
        }
    }
    return false
}

module.exports = {holydays}
