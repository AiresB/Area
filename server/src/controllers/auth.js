const bcrypt = require('bcrypt');
const { stringify } = require('uuid');

const { userRegister, userFind, userUpdate } = require("../models/user");

exports.login = async (req, res) => {
    const { email, password } = req.body;

    if (!password || !email) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }

    user = await userFind( "email", email )
    if (!user) {
        return res.status(404).json({ error: true, message: 'User not find' });
    }
    bcrypt.compare(password, user.password, function(err, match) {
        if (err) {
            return res.status(500).json({
                error: true,
                message: 'Serveur Error'
            })
        } else
        if (match == false) {
            return res.status(403).json({
                error: true,
                message: 'Wrong Password'
            })
        } else {
            res.status(200).json({
                error: false,
                user: user
            });
            return
        }
    });
}

exports.register = async (req, res) => {
    const { username, password, email } = req.body;

    if (!username || !password || !email) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }

    const hash = await bcrypt.hash(password, 10)
    const google = "0"
    user = await userFind( "email", email )
    if (user) {
        res.status(401).json({
            error: true,
            message: "Email already used"
        });
        return
    }
    const userData = await userRegister({ username, hash, email, google});
    res.status(201).json({
        error: false,
        user: userData
    });
};

exports.update = async (req, res) => {
    const { id, username, email, google } = req.body;

    if (!id || !username || !email || !google) {
        res.status(400).json({error: true, message: "arguments missing"});
        return;
    }

    user = await userUpdate({id, username, email, google})
    if (!user) {
        res.status(500).json({
            error: true,
            message: "Error during update"
        });
        return
    } else {
        res.status(200).json({
            error: false,
            user: user
        });
    }
}

exports.logout = (req, res) => {
    if (req.session) req.session = null;
    res.status(200).redirect("/");
}