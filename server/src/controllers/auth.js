const bcrypt = require('bcrypt');
const { stringify } = require('uuid');

const { userCreate, userFind } = require("../models/user");

exports.login = async (req, res) => {
    const body = JSON.stringify(user)
    userFind({ email: JSON.stringify(req.body.email) })
        .then(user => {
            if (!user) {
                return res.status(401).json({ error: 'Utilisateur non trouvé !' });
            }
            bcrypt.compare(req.body.password, user.password)
                .then(valid => {
            if (!valid) {
                return res.status(401).json({ error: 'Mot de passe incorrect !' });
            }
            res.status(200).json({
                userId: user._id,
                token: 'TOKEN'
              });
            })
        .catch(error => res.status(500).json({ error }));
    })
    .catch(error => res.status(500).json({ error }));
};

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