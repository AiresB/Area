/*  Lib Import   */

/*  Modules Import  */
const {actionChecker} = require("./actionsFunc")
const {getAreaList} = require("../models/area")

/*  Code    */

const hoock = async () => {
    var run = true

    while (run) {
        var areaList = await getAreaList()
        for (var i = 0; i < areaList.length ; i++) {
            actionChecker(areaList[i])
        }
        await new Promise(r => setTimeout(r, 60000));
    }
}

module.exports = {hoock}