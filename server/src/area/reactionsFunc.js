/*  Lib Import   */

/*  Modules Import  */
const {reactions} = require("./reactions")
const {manageGoogleReaction} = require("./../Google/google_api")

/*  Code    */

const gmail_reaction = (element) => {
    manageGoogleReaction(1);
}

const gcalendar_reaction = (element) => {
    manageGoogleReaction(2);
}

gcalendar_reaction();

/*  list functions */
const reactFuncList = {
    1: gmail_reaction,
    2: gcalendar_reaction
}

const reactionAct = (element) => {
    reactFuncList.element.reactId(element)
}

module.exports = {reactionAct, reactFuncList}