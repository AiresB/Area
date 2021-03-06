/*  Lib Import   */

/*  Modules Import  */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")
const {manageGoogleAction} = require("./../Google/google_api")
const {sunset, surise, sunrise} = require("../api/sun")

/*  Code    */


const its_8_action = (element) => {
    var today = new Date()
    if (today.getHours() == 7 && today.getMinutes() == 00) {
        return true
    }
    return false
}

const gmail_action = (element) => {
    return manageGoogleAction(1, element);
}

const gcalendar_action = (element) => {
    return manageGoogleAction(2, element);
}

const youtube_action = (element) => {
    return manageGoogleAction(3, element);
}

const gdrive_action = (element) => {
    return manageGoogleAction(4, element);
}

const weather_action = (element) => {
    return false
}

const sunrise_action = (element) => {
    return sunrise()
}

const sunset_action = (element) => {
    return sunset()
}

/*  list functions */
const actFuncList = {
    1: its_8_action,
    2: gmail_action,
    3: gcalendar_action,
    4: youtube_action,
    5: gdrive_action,
    6: weather_action,
    7: sunrise_action,
    8: sunset_action
}

/* action checker */
const actionChecker = async (element) => {
    console.log("in action checker")

    if (actFuncList[element.action_id](element)) {
        reactionAct(element);
    } else {
        return;
    }

}

module.exports = {actionChecker}