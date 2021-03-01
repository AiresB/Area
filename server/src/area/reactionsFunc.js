/*  Lib Import   */

/*  Modules Import  */
const {reactions} = require("./reactions")

/*  Code    */

const reaction1func = (element) => {
    //todo action 1

}

const reaction2func = (element) => {
    //todo action 2

}

/*  list functions */
exports.reactFuncList = {
    1: reaction1func,
    2: reaction2func
}

const reactionAct = (element) => {
    reactFuncList[element.reactId](element)
}

module.exports = {reactionAct}