/*  Lib Import   */
const router = require('express').Router();
const {google} = require('googleapis');
const bodyParser = require('body-parser');

/*  Modules Import  */
const config = require("../config");

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar',
                'https://www.googleapis.com/auth/youtube'
              ];

/*  Routes  */
router.use(bodyParser.urlencoded({ extended: true }))

router.get("/login/google", (req, res) => {
    const oAuth2Client = new google.auth.OAuth2("865339468389-lpsq6i6a0f858c20dfu89rq6fe8u2fjf.apps.googleusercontent.com", "V_T_gQRdW6XRbkzykb99y6mM", "http://10.0.2.2:8080/user/login/google/callback");
    const authUrl = oAuth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: SCOPES,
      });
    return res.json({authUrl});
});

router.get("/login/google/callback", async (req, res) => {
    const code = req.query.code;
    oAuth2Client.getToken(code, (err, token) => {
    if (err)
        return console.error('Error retrieving access token', err);
    //Stocker token dans la DB
    //res.send("Coming soon")
    });
});

module.exports = router;