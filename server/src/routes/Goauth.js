/*  Lib Import   */
const router = require('express').Router();

/*  Modules Import  */
const config = require("../config");

/*  Routes  */
router.get("/login/google", (req, res) => {
    //Todo
    res.send("Coming soon")
    //res.json({ redirectUrl: `` });
});

router.get("/login/google/callback", async (req, res) => {
    //Todo
    res.send("Coming soon")
});

module.exports = router;