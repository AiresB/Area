/*  Lib Import   */
const router = require('express').Router();


/*  Modules Import  */
const area = require("../controllers/area")
const { json } = require('body-parser');

/*  Routes  */
router.post("/create", area.create);

router.delete("/delete", area.delete);

router.put("/update", area.update);

router.post("/getbyid", area.getbyid);

module.exports = router;