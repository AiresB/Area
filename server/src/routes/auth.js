/*  Lib Import   */
const router = require('express').Router();


/*  Modules Import  */
const Goauth = require("./Goauth")

/*  Routes  */
router.post("/login", async (req, res) => {
    //Todo
    res.send("Login coming soon")
});

router.post("/register", async (req, res) => {
    //Todo
    res.send("Login coming soon")
});

router.get("/logout", (req, res) => {
    if (req.session) req.session = null;
    res.redirect("/");
});

router.use("/", Goauth);

module.exports = router;