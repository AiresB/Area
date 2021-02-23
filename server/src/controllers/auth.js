const bcrypt = require('bcrypt');
const { stringify } = require('uuid');

const { userCreate, userFind } = require("../models/user");

exports.login = async (req, res) => {
    const { email, password } = req.body;
    user = await userFind( email )
    if (!user) {
        console.log("in error")
        return res.status(401).json({ error: 'Utilisateur non trouvé !' });
    }
    bcrypt.compare(password, user.password, function(err, match) {
        if (err) {
            return res.status(500).json({
                success: false,
                message: 'Serveur Error'
            })
        } else
        if (match == false) {
            return res.status(401).json({
                success: false,
                message: 'Wrong Password'
            })
        } else {
            res.status(200).json({
                user: user
            });
            return
        }
    });
}

exports.register = async (req, res) => {
    const { username, password, email } = req.body;

    if (!username || !password || !email) {
        res.json({});
        return;
    }
    const userData = await userCreate({ username, password, email});
    res.json({
        error: false,
        data: userData
    });
};

exports.update = async (req, res) => {
    delete req.body._id;
    const newUser = new User({
        id:req.body.id,
        username:req.body.username,
        password:req.body.password,
        email:req.body.email,
        google:req.body.google
    })
    newUser.update()
      .then(() => res.status(201).json({ message: 'User updated !'}))
      .catch(error => res.status(400).json({ error }));
}

exports.logout = (req, res) => {
    if (req.session) req.session = null;
    res.status(200).redirect("/");
}