/*  Lib Import   */
const router = require('express').Router();


/*  Modules Import  */
const Goauth = require("./Goauth");
const auth = require("../controllers/auth")
const { json } = require('body-parser');

/*  Routes  */
router.get("/login", auth.login);

router.post("/register", auth.register);

router.put("/update", auth.update);

router.get("/logout", auth.logout);

router.get("/delete", auth.logout);

router.use("/", Goauth);

module.exports = router;