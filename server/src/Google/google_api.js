const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');



const {gmail_listMails, gmail_sendMessage} = require("./gmail_api");
const {gcalendar_listEvents, gcalendar_createEvent} = require("./gcalendar_api");

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar'];

const TOKEN_PATH = './../Google/token.json';


function manageGoogleReaction(rea_id)
{
  fs.readFile('./../Google/credentials.json', (err, content) => {
    if (err) return console.log('Error loading client secret file:', err);

    if (rea_id == 1)
      authorize(JSON.parse(content), gmail_sendMessage);
    if (rea_id == 2)
      authorize(JSON.parse(content), gcalendar_createEvent);
  });
}

/*fs.readFile('credentials.json', (err, content) => {
  if (err) return console.log('Error loading client secret file:', err);

  authorize(JSON.parse(content), listEvents);
  //authorize(JSON.parse(content), createEvent);
  //authorize(JSON.parse(content), getNbrOfMails);
  //authorize(JSON.parse(content), listMails);
  //authorize(JSON.parse(content), sendMessage);
});*/

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize(credentials, callback) {
  const {client_secret, client_id, redirect_uris} = credentials.installed;
  const oAuth2Client = new google.auth.OAuth2(
      client_id, client_secret, redirect_uris[0]);

  fs.readFile(TOKEN_PATH, (err, token) => {
    if (err) return getNewToken(oAuth2Client, callback);
    oAuth2Client.setCredentials(JSON.parse(token));
    callback(oAuth2Client);
  });
}

/**
 * Get and store new token after prompting for user authorization, and then
 * execute the given callback with the authorized OAuth2 client.
 * @param {google.auth.OAuth2} oAuth2Client The OAuth2 client to get token for.
 * @param {getEventsCallback} callback The callback for the authorized client.
 */
function getNewToken(oAuth2Client, callback) {
  const authUrl = oAuth2Client.generateAuthUrl({
    access_type: 'offline',
    scope: SCOPES,
  });
  console.log('Authorize this app by visiting this url:', authUrl);
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  rl.question('Enter the code from that page here: ', (code) => {
    rl.close();
    oAuth2Client.getToken(code, (err, token) => {
      if (err) return console.error('Error retrieving access token', err);
      oAuth2Client.setCredentials(token);
      // Store the token to disk for later program executions
      fs.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
        if (err) return console.error(err);
        console.log('Token stored to', TOKEN_PATH);
      });
      callback(oAuth2Client);
    });
  });
}

module.exports = {manageGoogleReaction}