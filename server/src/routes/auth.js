/*  Lib Import   */
const router = require('express').Router();
const bodyParser = require('body-parser');

/*  Modules Import  */
const Goauth = require("./Goauth");
const auth = require("../controllers/auth")
const { json } = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }))

/*  Routes  */
router.post("/login", auth.login);

router.post("/register", auth.register);

router.put("/update", auth.update);

router.post("/logout", auth.logout);

router.post("/delete", auth.logout);

router.use("/", Goauth);

module.exports = router;