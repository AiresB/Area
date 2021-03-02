const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gmail_listMails(auth) {
    const gmail = google.gmail({version: 'v1', auth});
    gmail.users.messages.list({
      userId: 'me',
    }, (err, res) => {
      if (err) return console.log('The API returned an error: ' + err);
      const mess = res.data.messages;
      if (mess.length) {
        console.log('Mails:');
        mess.forEach((mail) => {
          console.log(`- ${mail}`);
        });
      } else {
        console.log('No mail found.');
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
function gmail_sendMessage(auth) {
    var raw = makeBody('kheiji95800@gmail.com', 'kheiji95800@gmail.com', 'test subject', 'test message');
    gmail = google.gmail({version: 'v1', auth});
    gmail.users.messages.send({
        auth: auth,
        userId: 'me',
        resource: {
            raw: raw
        }
    });
}

module.exports = {gmail_listMails, gmail_sendMessage}