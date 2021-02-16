const bcrypt = require('bcrypt');

const {userRegister} = require("../models/user");

exports.login = async (req, res) => {
    User.find({ email: req.body.email })
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
        res.status(300).json({ error: "arguments missing" });
        return;
    }

    hash = await bcrypt.hash(req.body.password, 10)
    let newUser = {id:-1,
                    username: username,
                    password: hash,
                    email: email,
                    google: null};
    await userRegister(newUser)
        .then(() => res.status(201).json({ message: 'User registered !'}))
        .catch(error => res.status(400).json({ error }));
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