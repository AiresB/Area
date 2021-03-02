/*  Lib Import   */

/*  Modules Import  */

/*  Code    */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")
const {manageGoogleAction} = require("./../Google/google_api")

const gmail_action = (element) => {
    return manageGoogleAction(1, element);
}

const gcalendar_action = (element) => {
    return manageGoogleAction(2, element);
}

/*  list functions */
exports.actFuncList = {
    1: gmail_action,
    2: gcalendar_action
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