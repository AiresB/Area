/*  Lib Import   */
const router = require('express').Router();

/*  Modules Import  */
const auth = require('./auth');
const area = require('./area');
const other = require('../controllers/other')

/*  Routes  */
router.get("/", (req, res) => {
    res.send("Hello world!");
});

router.get("/about.json", other.about);

router.use("/user/", auth);

router.use("/area/", area);

module.exports = router;