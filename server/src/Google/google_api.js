const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const {userFind, userFindGoogleToken} = require('./../models/user')



const {gmail_haveNewMail, gmail_sendMessage} = require("./gmail_api");
const {gcalendar_oneHourToNext, gcalendar_createEvent} = require("./gcalendar_api");

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar'];

const my_token = {
  "token_type": "Bearer",
  "access_token": "ya29.A0AfH6SMDPFJ7LTrDG8oHdNUab96rhPftN53uUtoHXypCFvD_GM7EDygVuSXorP4dCR06KtPe7jOVVDbD5WC1lDqAXT4nCFn1jRNI24Smlywv6OAb-pEurt6E053iOvUSliQVJgODUwGLycYmUGqDcaQUrccpqAA",
  "scope": "email profile https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/gmail.send https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/gmail.readonly openid",
  "login_hint": "AJDLj6JUa8yxXrhHdWRHIV0S13cAT8036K9kuqMmfOp5oTCoYD3z6CrbyncvHepbV5NMwe4bpMNkgvsFR0TIe3Kqh9JybbCLkA",
  "expires_in": 3599,
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6ImU4NzMyZGIwNjI4NzUxNTU1NjIxM2I4MGFjYmNmZDA4Y2ZiMzAyYTkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiOTI2NTczOTEyMzIxLWk1dHZ2ZzdwY3FvODllamhma282Z2x0NGhpY3A0a3RpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiOTI2NTczOTEyMzIxLWk1dHZ2ZzdwY3FvODllamhma282Z2x0NGhpY3A0a3RpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTAxNzk4NDAwODU4ODEwNjc3MTE4IiwiZW1haWwiOiJjaGFuZGFtaWVuMUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6Im1KWWhLNHMzZ2ZCN3RrREgyMnlKbXciLCJuYW1lIjoiRGFtaWVuIENoYW4iLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2l6YjZpRTBLOFNNY3lWYTlLbHI0LWlYcUg3b0RzWmRIaWZjN1VUalE9czk2LWMiLCJnaXZlbl9uYW1lIjoiRGFtaWVuIiwiZmFtaWx5X25hbWUiOiJDaGFuIiwibG9jYWxlIjoiZW4tR0IiLCJpYXQiOjE2MTQ3NjE2MjksImV4cCI6MTYxNDc2NTIyOSwianRpIjoiYTgzOTBmMGU5ODY1MDk5MDQzMGU5YjU4ZmM3ZGVjMDdlZjg5ZWJhYiJ9.xI7vvt94q8Uv2TGEtYW2hVMttP_KpDr_TzhVqtEx4RDCquKBWCeKZfz5QGiGqdzEieJoDvAoumyOEWkq8SlpCxTn6u2_JjGvvqxdpRKgXhiRlWxaKKRcK97gSZmMYqfpXn2Pbv7_H_wxASSzDs9_5xgKUCQsf0kNBgi1z1gJr5c-4VLBo3BkSiU8th6RB_mb_pTuTYgqRAtxFzliR7pIk1OIzDtl8w6LCv2x9-scwIS3nVWjEcSrfmCk37nNkTlXm-VIh-jiJMNlwmSGRLuGzGgvErraBf6VViZ95B9gPAoCpAZU0_HxQangkfZfzMm0X_7fGK-l9zCCYoFwjL6thA",
  "session_state": {
    "extraQueryParams": {
      "authuser": "0"
    }
  },
  "first_issued_at": 1614761627227,
  "expires_at": 1614765226227,
  "idpId": "google"
}

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

//manageGoogleReaction(2,0)

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
const authorize_act = async function(credentials, callback, area) {
  //const token = await userFind("id", area.user_id);
  //console.log("token =", token.access_token)
  const {client_secret, client_id, redirect_uris} = credentials.installed;
  const oAuth2Client = new google.auth.OAuth2(
      client_id, client_secret, redirect_uris[0]);

    oAuth2Client.setCredentials(my_token);
    return callback(oAuth2Client, area);
}

module.exports = {manageGoogleReaction, manageGoogleAction}
