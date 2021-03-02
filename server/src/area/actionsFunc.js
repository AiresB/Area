/*  Lib Import   */

/*  Modules Import  */

/*  Code    */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")
const {manageGoogleAction} = require("./../Google/google_api")

const its_8_action = (element) => {
    return true
    /*const now = Date.now();
    if (now.getHours() == 22 && now.getMinutes() == 51) {
        console.log("yeah")
        return true
    }
    return false*/
}

const gmail_action = (element) => {
    return manageGoogleAction(1, element);
}

const gcalendar_action = (element) => {
    return manageGoogleAction(2, element);
}

/*  list functions */
const actFuncList = [its_8_action,
    its_8_action,
    gmail_action,
    gcalendar_action
]

/* action checker */
const actionChecker = async (element) => {
    console.log("action")
    if (its_8_action(element)) {
        reactionAct(element);
    } else {
        console.log("not activated")
    }

    /*if (actFuncList[element.actionId](element)) {
        reactionAct(element);
    } else {
        return;
    }*/

}

module.exports = {actionChecker}