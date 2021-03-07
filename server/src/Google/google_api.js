const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const { userFind } = require('./../models/user')



const {gmail_haveNewMail, gmail_sendMessage} = require("./gmail_api");
const {gcalendar_oneHourToNext, gcalendar_createEvent} = require("./gcalendar_api");
const {likeTop1FRVidéo, detectNewSub, addTop1InPlaylist} = require("./youtube_api");
const {gdrive_commentLastFile, gdrive_detectNewFile, gdrive_addGoogleDoc} = require('./gdrive_api');

const client_id = "675300751328-jc941ledsijsbb8j21iirkhljtj5l3dd.apps.googleusercontent.com";
const client_secret = "NxyxYAKc2yydN60Uakzmqr5M";
const redirect_uris = [ "http://localhost:5050" ];

const SCOPES = ['https://www.googleapis.com/auth/gmail.readonly',
                'https://www.googleapis.com/auth/gmail.send',
                'https://www.googleapis.com/auth/calendar',
                'https://www.googleapis.com/auth/youtube',
                'https://www.googleapis.com/auth/drive'];

function manageGoogleReaction(rea_id, area)
{
  if (rea_id == 1)
    authorize_act(gmail_sendMessage, area);
  if (rea_id == 2)
    authorize_act(gcalendar_createEvent, area);
  if (rea_id == 3)
    authorize_act(likeTop1FRVidéo, area);
  if (rea_id == 4)
    authorize_act(gdrive_commentLastFile, area);
  if (rea_id == 5)
    authorize_act(addTop1InPlaylist, area);
  if (rea_id == 6)
    authorize_act(gdrive_addGoogleDoc, area);
}

const manageGoogleAction = async function(a_id, area)
{
  var rep = false;
  if (a_id == 1)
    rep = await authorize_act(gmail_haveNewMail, area);
  if (a_id == 2)
    rep = await authorize_act(gcalendar_oneHourToNext, area);
  if (a_id == 3)
    rep = await authorize_act(detectNewSub, area);
  if (a_id == 4)
    rep = await authorize_act(gdrive_detectNewFile, area);
  return rep;
}

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {function} callback The callback to call with the authorized client.
 */
const authorize_act = async function(callback, area) {
  const token = await userFind("id", area.user_id);
  const oAuth2Client = new google.auth.OAuth2(client_id, client_secret, redirect_uris[0]);
  oAuth2Client.setCredentials(token.google);
  return callback(oAuth2Client, area);
}

module.exports = {manageGoogleReaction, manageGoogleAction}
