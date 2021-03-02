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
    var TOP1_video = response.data.items[0];
    if (TOP1_video.length == 0) {
      console.log('No vidéo found.');
    } else {

      console.log('Name : ' + TOP1_video.snippet.title);
      return TOP1_video.id;
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

module.exports = {likeTop1FRVidéo}