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

const youtube_reaction = (element) => {
    manageGoogleReaction(3, element);
}

const gdrive_reaction = (element) => {
    manageGoogleReaction(4, element);
}

const youtube_reaction2 = (element) => {
    manageGoogleReaction(5, element);
}

const gdrive_reaction2 = (element) => {
    manageGoogleReaction(6, element);
}

/*  list functions */
const reactFuncList = {
    1: gmail_reaction,
    2: gcalendar_reaction,
    3: youtube_reaction,
    4: gdrive_reaction,
    5: youtube_reaction2,
    6: gdrive_reaction2
}

const reactionAct = (element) => {
    reactFuncList[element.reaction_id](element)
}

module.exports = {reactionAct}
