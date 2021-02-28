/*  Lib Import   */

/*  Modules Import  */
const {actionChecker} = require("./area/actionsFunc")

/*  Code    */

const hoock = () => {
    var run = true

    while (run) {
        var areaList = [];//get area list
        areaList.forEach( element => actionChecker(element))
        //sleep(1min)
    }
}

module.exports = {hoock}