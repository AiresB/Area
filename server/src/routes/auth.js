/*  Lib Import   */
const router = require('express').Router();
const bodyParser = require('body-parser');

/*  Modules Import  */
const Goauth = require("./Goauth");
const auth = require("../controllers/auth")
const { json } = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }))

/*  Routes  */
router.get("/login", auth.login);

router.post("/register", auth.register);

router.put("/update", auth.update);

router.get("/logout", auth.logout);

router.get("/delete", auth.logout);

router.use("/", Goauth);

module.exports = router;