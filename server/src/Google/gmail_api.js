const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const { getbyid } = require('../controllers/area');
const { userFind } = require('../models/user');

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gmail_haveNewMail(auth, area) {
    const gmail = google.gmail({version: 'v1', auth});
    gmail.users.messages.list({
      userId: 'me',
      maxResults: 2,
    }, (err, res) => {
      if (err) {
        console.log('The API returned an error: ' + err);
        return false;
      }
      const mess = res.data.messages;
      var saved_id = "";
      if (mess.length) {
        mess.forEach((mail) => {
          saved_id = saved_id + mail.id;
        });
        if (area.actionDesc === "") {
          area.actionDesc = saved_id;
          return false;
        }
        if (area.actionDesc === saved_id)
          return false;
        else {
          area.actionDesc = saved_id;
          return true;
        }
      } else {
        area.actionDesc = "0";
        return false;
      }
    });
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
    console.log(mess.length);
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