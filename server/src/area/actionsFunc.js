/*  Lib Import   */

/*  Modules Import  */

/*  Code    */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")
const {manageGoogleAction} = require("./../Google/google_api")

const its_8_action = (element) => {
    const now = Date.now();
    if (now.getHours() == 8 && now.getMinutes() == 0) {
        reactionAct(element)
    }
}

const gmail_action = (element) => {
    return manageGoogleAction(1, element);
}

const gcalendar_action = (element) => {
    return manageGoogleAction(2, element);
}

/*  list functions */
exports.actFuncList = {
    1: its_8_action,
    2: gmail_action,
    3: gcalendar_action
}

/* action checker */
const actionChecker = async (element) => {
    if (actFuncList[element.actionId](element)) {
        reactionAct(element);
    } else {
        return;
    }

}

module.exports = {actionChecker}