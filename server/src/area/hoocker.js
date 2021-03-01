/*  Lib Import   */

/*  Modules Import  */
const {actionChecker} = require("./actionsFunc")

/*  Code    */

const hoock = () => {
    var run = true

    while (run) {
        var areaList = [];//get area list
        areaList.forEach( element => actionChecker(element))
        //await new Promise(r => setTimeout(r, 60000));
    }
}

module.exports = {hoock}