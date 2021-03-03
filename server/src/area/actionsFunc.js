/*  Lib Import   */

/*  Modules Import  */

/*  Code    */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")
const {manageGoogleAction} = require("./../Google/google_api")

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

/*  list functions */
const actFuncList = {
    1: its_8_action,
    2: gmail_action,
    3: gcalendar_action
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