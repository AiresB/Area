/*  Lib Import   */

/*  Modules Import  */
const {actionChecker} = require("./actionsFunc")
const {getAreaList} = require("../models/area")

/*  Code    */

const hoock = () => {
    var run = true

    while (run) {
        var areaList = getAreaList()
        areaList.forEach( element => actionChecker(element))
        //await new Promise(r => setTimeout(r, 60000));
    }
}

module.exports = {hoock}