/*  Lib Import   */

/*  Modules Import  */
const {reactions} = require("./reactions")
const {manageGoogleReaction} = require("./../Google/google_api")

/*  Code    */

const gmail_reaction = (element) => {
    console.log("element")
    manageGoogleReaction(1, element);
}

const gcalendar_reaction = (element) => {
    console.log("element")
    manageGoogleReaction(2, element);
}

/*  list functions */
exports.reactFuncList = {
    1: gmail_reaction,
    2: gcalendar_reaction
}

const reactionAct = (element) => {
    console.log("reaction")
    gmail_reaction(element)
    gcalendar_reaction(element)
    //reactFuncList[element.reactionId](element)
}

module.exports = {reactionAct}