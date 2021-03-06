const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const { stderr } = require('process');


/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const likeTop1FRVidéo = async function (auth, area) {
  var youtube = google.youtube({version: 'v3', auth});
  youtube.videos.list({
    auth: auth,
    part: 'snippet,contentDetails,statistics',
    chart : "mostPopular",
    regionCode : "FR",
  }, function(err, response) {
    if (err) {
      console.log('The API returned an error: ' + err);
      return 1;
    }
    const TOP1_video = response.data.items;
    if (TOP1_video.length == 0) {
      console.log('No vidéo found.');
      return 1;
    } else {
      youtube.videos.rate({
        auth: auth,
        id: TOP1_video[0].id,
        rating : "like",
      });
    }
  });
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const detectNewSub = async function(auth, area) {
  var youtube = google.youtube({version: 'v3', auth});
  var channel = await youtube.channels.list({
    auth: auth,
    part: 'statistics',
    mine : true,
  });
  var channel_info = channel.data.items;
  if (channel_info.length == 0) {
    console.log('Nothing found.');
    return false;
  } else {
    if (save_nbr_sub == "")
      save_nbr_sub = channel_info[0].statistics.subscriberCount;
    if (parseInt(channel_info[0].statistics.subscriberCount, 10) <= parseInt(save_nbr_sub, 10)) {
      save_nbr_sub = channel_info[0].statistics.subscriberCount;
      return false;
    }
    else {
      save_nbr_sub = channel_info[0].statistics.subscriberCount;
      return true;
    }
  }
}

module.exports = {likeTop1FRVidéo, detectNewSub}