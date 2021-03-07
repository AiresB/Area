/*  Lib Import   */

/*  Modules Import  */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")
const {manageGoogleAction} = require("./../Google/google_api")
const {sunset, surise, sunrise} = require("../api/sun")
const {holidays} = require("../api/holidays")

/*  Code    */


const its_8_action = (element) => {
    var today = new Date()
    if (today.getHours() == 7 && today.getMinutes() == 00) {
        reactionAct(element)
    }
}

const gmail_action = async (element) => {
    if (await manageGoogleAction(1, element)) {
        reactionAct(element)
    }
}

const gcalendar_action = async (element) => {
    if (await manageGoogleAction(2, element)) {
        reactionAct(element)
    }
}

const youtube_action = async (element) => {
    if (await manageGoogleAction(3, element)) {
        reactionAct(element)
    }
}

const gdrive_action = async (element) => {
    if (await manageGoogleAction(4, element)) {
        reactionAct(element)
    }
}

const weather_action = async (element) => {
    if (false) {
        reactionAct(element)
    }
}

const sunrise_action = async (element) => {
    if (await sunrise()) {
        reactionAct(element)
    }
}

const sunset_action = async (element) => {
    if (await sunset()) {
        reactionAct(element)
    }
}

const holidays_action = async (element) => {
    var today = new Date()
    if (today.getHours() == 7 && today.getMinutes() == 00) {
        if (holidays())
            reactionAct(element)
    }
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
    8: sunset_action,
    9: holidays_action
}

/* action checker */
const actionChecker = async (element) => {
    actFuncList[element.action_id](element)
}

module.exports = {actionChecker}