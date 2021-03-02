/*  Lib Import   */

/*  Modules Import  */
const {reactions} = require("./reactions")
const {manageGoogleReaction} = require("./../Google/google_api")

/*  Code    */

const gmail_reaction = (element) => {
    manageGoogleReaction(1, element);
}

const gcalendar_reaction = (element) => {
    manageGoogleReaction(2, element);
}

/*  list functions */
const reactFuncList = {
    1: gmail_reaction,
    2: gcalendar_reaction
}

const reactionAct = (element) => {
    console.log("in reaction Act")
    //reactFuncList[element.reactionId](element)
}

module.exports = {reactionAct}