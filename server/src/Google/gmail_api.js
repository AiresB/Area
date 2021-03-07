const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const { getbyid } = require('../controllers/area');
const { userFind } = require('../models/user');
const { areaUpdate } = require('../models/area');

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const gmail_haveNewMail = async function(auth, area) {
    const gmail = google.gmail({version: 'v1', auth});
    var user = await gmail.users.getProfile({
      auth: auth,
      userId: 'me',
    });

    var nbr_messages = user.data.messagesTotal;

    if (area.action_desc == "null")
      areaUpdate({id: area.id, userId: area.user_id, actionId: area.action_id, actionDesc: nbr_messages.toString(), reactionId: area.reaction_id, reactionDesc: area.reaction_desc,});
    if (nbr_messages <= parseInt(area.action_desc, 10)) {
      areaUpdate({id: area.id, userId: area.user_id, actionId: area.action_id, actionDesc: nbr_messages.toString(), reactionId: area.reaction_id, reactionDesc: area.reaction_desc,});
      return false;
    }
    areaUpdate({id: area.id, userId: area.user_id, actionId: area.action_id, actionDesc: nbr_messages.toString(), reactionId: area.reaction_id, reactionDesc: area.reaction_desc,});
    return true;
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gmail_getNbrOfMails(auth) {
  const gmail = google.gmail({version: 'v1', auth});
  gmail.users.history.list({
    userId: 'me',
    maxResults: 100000,
  }, (err, res) => {
    if (err) return console.log('The API returned an error: ' + err);
    const mess = res.data.messages;
  });
}


function makeBody(to, from, subject, message) {
    var str = ["Content-Type: text/plain; charset=\"UTF-8\"\n",
        "MIME-Version: 1.0\n",
        "Content-Transfer-Encoding: 7bit\n",
        "to: ", to, "\n",
        "from: ", from, "\n",
        "subject: ", subject, "\n\n",
        message
    ].join('');

    var encodedMail = new Buffer.from(str).toString("base64").replace(/\+/g, '-').replace(/\//g, '_');
        return encodedMail;
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const gmail_sendMessage = async function (auth, area) {
  var user = await userFind("id", area.user_id);
    console.log(user.email);
    var raw = makeBody(user.email, user.email, 'test subject', 'test message');
    gmail = google.gmail({version: 'v1', auth});
    gmail.users.messages.send({
        auth: auth,
        userId: 'me',
        resource: {
            raw: raw
        }
    });
}

module.exports = {gmail_haveNewMail, gmail_sendMessage}