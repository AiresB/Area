const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const {userFind} = require('./../models/user')



const {gmail_haveNewMail, gmail_sendMessage} = require("./gmail_api");
const {gcalendar_oneHourToNext, gcalendar_createEvent} = require("./gcalendar_api");

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar'];

const my_token = {
  "token_type": "Bearer",
  "access_token": "ya29.a0AfH6SMBUSJJ1Rx2U68_XK8InPA2Qf81Q3DLZhJh6Z-rsPigMiZZGxU3ql1c0RhZA_nhF0hYQheifP5B7x3wHyaearGylYSpZpF3SGI92BoPGTF43L3Kos6bglEEm-bj9MhmjO6pp_JdhxOy4cRymQwYHP_hb",
  "scope": "email profile https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/gmail.readonly https://www.googleapis.com/auth/calendar openid https://www.googleapis.com/auth/gmail.send",
  "login_hint": "AJDLj6JUa8yxXrhHdWRHIV0S13cAT8036K9kuqMmfOp5oTCoYD3z6CrbyncvHepbV5NMwe4bpMNkgvsFR0TIe3Kqh9JybbCLkA",
  "expires_in": 3599,
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6ImU4NzMyZGIwNjI4NzUxNTU1NjIxM2I4MGFjYmNmZDA4Y2ZiMzAyYTkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiOTI2NTczOTEyMzIxLWk1dHZ2ZzdwY3FvODllamhma282Z2x0NGhpY3A0a3RpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiOTI2NTczOTEyMzIxLWk1dHZ2ZzdwY3FvODllamhma282Z2x0NGhpY3A0a3RpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTAxNzk4NDAwODU4ODEwNjc3MTE4IiwiZW1haWwiOiJjaGFuZGFtaWVuMUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IlNzNWFZX0tpUFpkM0FhMjhDNF9Sd0EiLCJuYW1lIjoiRGFtaWVuIENoYW4iLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2l6YjZpRTBLOFNNY3lWYTlLbHI0LWlYcUg3b0RzWmRIaWZjN1VUalE9czk2LWMiLCJnaXZlbl9uYW1lIjoiRGFtaWVuIiwiZmFtaWx5X25hbWUiOiJDaGFuIiwibG9jYWxlIjoiZW4tR0IiLCJpYXQiOjE2MTQ3MjU0ODUsImV4cCI6MTYxNDcyOTA4NSwianRpIjoiNTIxNTkxZWZkN2YxOTM2OWJkZTIwMWJkYzI0YzQ5ODM0ZmY1NDcxNyJ9.OFNjv6n1yi9odA2AGon5P-MTwudf9At93ei4B1lG0QhrXbDWRd8xs_nvSV4N-tx9Yo6O3bVF7e4hZOzu1cjWpTsTT1Mkhru_rcDLW1uJLjY2awsHuI-6yOkSKtLMC5Pk76yCrDLl9q-JGJX1PwLGGRgmfKr1xNN8GTajI_dGT5mlFGqNgPClTfoUbgQ7qqMT0Kbt3L13RQDW7RmTDywXAmaITelbH4y6rGxwJ9VGELgue-6NGlugaOQTCMY0KUu5CsEwBpBJrWwwP4E7_aZsO1cc0Xm5Qmuo85jbpNGlyoSVz662RhrDZx2QdYptjMeHWhQzpt0fO6n6FrjfnBrzQw",
  "session_state": {
    "extraQueryParams": {
      "authuser": "0"
    }
  },
  "first_issued_at": 1614725484172,
  "expires_at": 1614729083172,
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

    oAuth2Client.setCredentials(my_token);
    return callback(oAuth2Client, area);
}

module.exports = {manageGoogleReaction, manageGoogleAction}
