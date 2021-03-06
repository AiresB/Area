/*  Lib Import   */
const router = require('express').Router();
const bodyParser = require('body-parser');

/*  Modules Import  */
const area = require("../controllers/area")
const { json } = require('body-parser');

router.use(bodyParser.urlencoded({ extended: true }))

/*  Routes  */
router.post("/create", area.create);

router.delete("/delete", area.delete);

router.put("/update", area.update);

router.post("/getbyid", area.getbyid);

router.get("/actionlist", area.actionlist);

router.get("/reactionlist", area.reactionlist);

module.exports = router;