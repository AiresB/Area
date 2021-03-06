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

const createAreaPlaylist = async function(auth) {
  var youtube = google.youtube({version: 'v3', auth});
  const all_playlist = await youtube.playlists.list({
    part: 'snippet',
    mine: true
  });
  for (var i = 0; i < all_playlist.length; i++) {
    if (all_playlist.data.items[i].snippet.title == 'Area')
      return;
  }
  youtube.playlists.insert({
    part: 'snippet',
    requestBody: {
      snippet: {
        title: "Area"
      }
    }
  });
}

const addTop1InPlaylist = async function(auth, area) {
  var youtube = google.youtube({version: 'v3', auth});
  const top_videos = await youtube.videos.list({
    auth: auth,
    part: 'snippet,contentDetails,statistics',
    chart : "mostPopular",
    regionCode : "FR",
  });
  const TOP1_video = top_videos.data.items;
  const lol = await createAreaPlaylist(auth);
  const all_playlist = await youtube.playlists.list({
    part: 'snippet',
    mine: true
  });
  var areaPlaylistId = ""
  for (var i = 0; i < all_playlist.data.items.length; i++) {
    if (all_playlist.data.items[i].snippet.title == 'Area')
      areaPlaylistId = all_playlist.data.items[i].id;
  }
  console.log(areaPlaylistId);
  await youtube.playlistItems.insert({
    part: 'snippet',
    requestBody: {
      snippet: {
        playlistId: areaPlaylistId,
        position: 0,
        resourceId: {
          kind: "youtube#video",
          videoId: TOP1_video[0].id
        }
      }
    }
  })
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

module.exports = {likeTop1FRVidéo, detectNewSub, addTop1InPlaylist}