/*  Lib Import   */
const router = require('express').Router();

/*  Modules Import  */
const auth = require('./auth');

/*  Routes  */
router.get("/", (req, res) => {
    res.send("Hello world!");
});

router.get("/about.json", async (req, res) => {
    //ToDo
    res.send("Coming soon")
});

router.use("/", auth);

module.exports = router;