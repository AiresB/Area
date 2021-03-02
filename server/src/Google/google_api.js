const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const {userFind} = require('./../models/user')



const {gmail_haveNewMail, gmail_sendMessage} = require("./gmail_api");
const {gcalendar_oneHourToNext, gcalendar_createEvent} = require("./gcalendar_api");

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar'];

function manageGoogleReaction(rea_id, area)
{
  fs.readFile('./src/Google/credentials.json', (err, content) => {
    if (err) return console.log('Error loading client secret file:', err);

    if (rea_id == 1)
      authorize_act(JSON.parse(content), gmail_sendMessage, area);
    if (rea_id == 2)
      authorize_act(JSON.parse(content), gcalendar_createEvent, area);
  });
}

function manageGoogleAction(a_id, area)
{
  fs.readFile('./src/Google/credentials.json', (err, content) => {
    if (err) {
      console.log('Error loading client secret file:', err);
      return false;
    }
    if (a_id == 1)
      return authorize_act(JSON.parse(content), gmail_haveNewMail, area);
    if (a_id == 2)
      return authorize_act(JSON.parse(content), gcalendar_oneHourToNext, area);
  });
}

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize_act(credentials, callback, area) {
  console.log(credentials)
  const token = userFind("id", area.user_id).google;
  const {client_secret, client_id, redirect_uris} = credentials.web;
  const oAuth2Client = new google.auth.OAuth2(
      client_id, client_secret, redirect_uris[0]);

    oAuth2Client.setCredentials(token);
    return callback(oAuth2Client, area);
}

module.exports = {manageGoogleReaction, manageGoogleAction}