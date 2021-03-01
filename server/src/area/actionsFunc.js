/*  Lib Import   */

/*  Modules Import  */

/*  Code    */
const {reactionAct} = require("./reactionsFunc")
const {actions} = require("./actions")

const action1func = (element) => {
    //todo action 1

}

const action2func = (element) => {
    //todo action 2

}

/*  list functions */
exports.actFuncList = {
    1: action1func,
    2: action2func
}

/* action checker */
const actionChecker = async (element) => {
    if (actFuncList[element.actionId](element)) {
        reactionAct(element);
    } else {
        return
    }

}

module.exports = {actionChecker}