const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const {userFind} = require('./../models/user')



const {gmail_haveNewMail, gmail_sendMessage} = require("./gmail_api");
const {gcalendar_oneHourToNext, gcalendar_createEvent} = require("./gcalendar_api");

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar'];

const TOKEN_PATH = './../Google/token.json';

const my_token = {
  "token_type": "Bearer",
  "access_token": "ya29.A0AfH6SMBjN1dn6lDbP1cWTyVKEg8zxk8dZX_LNa50aZnmudlIQl8lWP2lkVAfWfJtJ7WT524PB6Wz2TS8HPq098IZ8lALSVMm6Ti6pjZk9IoXID9xadpdZegDOaM1H1ikUEN5ZFrqu1mcyrsGbs--VMdlbp59",
  "scope": "email profile https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/gmail.readonly https://www.googleapis.com/auth/userinfo.profile openid https://www.googleapis.com/auth/gmail.send",
  "login_hint": "AJDLj6JUa8yxXrhHdWRHIV0S13cAT8036K9kuqMmfOp5oTCoYD3z6CrbyncvHepbV5NMwe4bpMNkgvsFR0TIe3Kqh9JybbCLkA",
  "expires_in": 3599,
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6ImZlZDgwZmVjNTZkYjk5MjMzZDRiNGY2MGZiYWZkYmFlYjkxODZjNzMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiOTI2NTczOTEyMzIxLWk1dHZ2ZzdwY3FvODllamhma282Z2x0NGhpY3A0a3RpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiOTI2NTczOTEyMzIxLWk1dHZ2ZzdwY3FvODllamhma282Z2x0NGhpY3A0a3RpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTAxNzk4NDAwODU4ODEwNjc3MTE4IiwiZW1haWwiOiJjaGFuZGFtaWVuMUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IkxSRmdIMmVWVDJHYm9KM3dKR1ZPZ2ciLCJuYW1lIjoiRGFtaWVuIENoYW4iLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2l6YjZpRTBLOFNNY3lWYTlLbHI0LWlYcUg3b0RzWmRIaWZjN1VUalE9czk2LWMiLCJnaXZlbl9uYW1lIjoiRGFtaWVuIiwiZmFtaWx5X25hbWUiOiJDaGFuIiwibG9jYWxlIjoiZW4tR0IiLCJpYXQiOjE2MTQ3MDI3NzcsImV4cCI6MTYxNDcwNjM3NywianRpIjoiNTg1YTc4ZDJjMjY2Mjc3M2JjNzgxZjg3ZjAxNjBhMDlhYTI1M2NlYSJ9.Ps16ctOPk1NXOKhDxpfwa6lXOo2bpLPNo_AAVgSGTEMQGbYeV60oADHJqGQlTYLMQj8Sjn4u1MHgn7FOECMG8AM_tQrezM5QzQ5BKZNupyvwRPaY2T59Z1zJDopp4uPp8SQSMuUuZ-5SnpSOJkdKhAJKSBKu00L3uElpH3Mp7V4ZWv58J5AzUdK-esmRBGZumBjZU7tYQAYRx3Vnk6TY0i78wDgZatOt2EsCGkCmJw6NbHYVF_PtzH8KFvawaSDnJ6tDU4h8oG_UIDxXDOtMQI6hpSesRMuMNjFZ6prm6cujea1oPC4o5iHU12hVWn0n-GPpBdfT9P9SCDbz-7GPNQ",
  "session_state": {
  "extraQueryParams": {
  "authuser": "0"
  }
  },
  "first_issued_at": 1614702776056,
  "expires_at": 1614706375056,
  "idpId": "google"
  }


function manageGoogleReaction(rea_id, area)
{
  fs.readFile('./../Google/credentials.json', (err, content) => {
    if (err) return console.log('Error loading client secret file:', err);

    if (rea_id == 1)
      authorize_rea(JSON.parse(content), gmail_sendMessage);
    if (rea_id == 2)
      authorize_rea(JSON.parse(content), gcalendar_createEvent);
  });
}

function manageGoogleAction(a_id, area)
{
  fs.readFile('./../Google/credentials.json', (err, content) => {
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

manageGoogleReaction(2)

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize_rea(credentials, callback, area) {
  const token = userFind("id", area.userId).google;
  const {client_secret, client_id, redirect_uris} = credentials.installed;
  const oAuth2Client = new google.auth.OAuth2(
      client_id, client_secret, redirect_uris[0]);
    oAuth2Client.setCredentials(my_token);
    callback(oAuth2Client);
}

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize_act(credentials, callback, area) {
  const token = userFind("id", area.userId).google;
  const {client_secret, client_id, redirect_uris} = credentials.installed;
  const oAuth2Client = new google.auth.OAuth2(
      client_id, client_secret, redirect_uris[0]);

    oAuth2Client.setCredentials(my_token);
    return callback(oAuth2Client, area);
}

module.exports = {manageGoogleReaction, manageGoogleAction}