const { areaUpdate } = require('../models/area');
const fetch = require("node-fetch");

const isRaining = (weat) => {
    rain = "Rain"
    for (var i = 0; i < weat.length; i++) {
        if (rain.localeCompare(weat[i].main) == 0) {
            return true
        }
    }
    return false
}

const weather = async (element) => {
    url = "https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=3ca7ac710975ca6f256d01eabc07f6b0"
    const response = await fetch(url)
    const myJson = await response.json()
    var Rain = isRaining(myJson.weather)
    var ret = null

    if (element.action_desc == false && Rain == true) {
        ret = true
    } else {
        ret = false
    }
    areaUpdate({id: area.id, userId: area.user_id, actionId: area.action_id, actionDesc: Rain, reactionId: area.reaction_id, reactionDesc: area.reaction_desc,});
    return ret
}

module.exports = {weather}