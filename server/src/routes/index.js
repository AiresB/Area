/*  Lib Import   */
const router = require('express').Router();

/*  Modules Import  */
const auth = require('./auth');
const area = require('./area');

/*  Routes  */
router.get("/", (req, res) => {
    res.send("Hello world!");
});

router.get("/about.json", async (req, res) => {
    //ToDo
    res.send("Coming soon")
});

router.use("/", auth);
//router.use("/user/", auth);

router.use("/area/", area);

module.exports = router;