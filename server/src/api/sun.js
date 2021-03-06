const fetch = require("node-fetch");

const sunrise = async () => {
    url = 'https://api.sunrise-sunset.org/json?lat=48.82092343387392&lng=-2.368272847167985'
    const response = await fetch(url)
    const myJson = await response.json();
    const sunrise = myJson.results.sunrise.slice(0,-6)

    var now = new Date()
    nowstr = now.getHours().toString().concat(":", now.getMinutes().toString())

    if (sunrise.localeCompare(nowstr) == 0) {
        return true
    } else {
        return false
    }
}

const sunset = async () => {
    url = 'https://api.sunrise-sunset.org/json?lat=48.82092343387392&lng=-2.368272847167985'
    const response = await fetch(url)
    const myJson = await response.json();
    const sunset = myJson.results.sunset.slice(0,-6)

    var now = new Date()
    nowstr = (now.getHours() - 12).toString().concat(":", now.getMinutes().toString())

    if (sunset.localeCompare(nowstr) == 0) {
        return true
    } else {
        return false
    }
}

module.exports = {sunset, sunrise}