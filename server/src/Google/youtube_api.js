const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');


/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function getTop1FRVidéo(auth) {
  var youtube = google.youtube({version: 'v3', auth});
  youtube.videos.list({
    auth: auth,
    part: 'snippet,contentDetails,statistics',
    chart : "mostPopular",
    regionCode : "FR",
  }, function(err, response) {
    if (err) {
      console.log('The API returned an error: ' + err);
      return;
    }
    var TOP1_video = response.data.items;
    if (TOP1_video.length == 0) {
      console.log('No vidéo found.');
      return;
    } else {

      console.log('Name : ' + TOP1_video[0].snippet.title);
      return TOP1_video[0].id;
    }
  });
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function likeTop1FRVidéo(auth) {
  var youtube = google.youtube({version: 'v3', auth});
  youtube.videos.rate({
    auth: auth,
    id: getTop1FRVidéo(auth),
    rating : "like",
  }, function(err, response) {
    if (err) {
      console.log('The API returned an error: ' + err);
      return;
    }
    console.log("You liked the TOP1 popular FR vidéo")
  });
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function detectNewSub(auth, area) {
  var youtube = google.youtube({version: 'v3', auth});
  youtube.channels.list({
    auth: auth,
    part: 'statistics',
    mine : true,
  }, function(err, response) {
    if (err) {
      console.log('The API returned an error: ' + err);
      return false;
    }
    var my_subs = response.data.items[0];
    if (my_subs.length == 0) {
      console.log('Nothing found.');
      return false;
    } else {
      if (area.actionDesc == "")
        area.actionDesc = my_subs[0].statistics.subscriberCount;
      if (parseInt(my_subs[0].statistics.subscriberCount, 10) <= parseInt(area.actionDesc, 10))
        return false;
      else {
        area.actionDesc = my_subs[0].statistics.subscriberCount;
        return true;
      }
    }
  });
}

module.exports = {likeTop1FRVidéo, detectNewSub}