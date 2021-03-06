const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');

var save_storage_usage = 348023

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const gdrive_detectNewFile = async (auth, area) => {
  const drive = google.drive({version: 'v3', auth});
  var info = await drive.about.get({
    fields : "*"
  });
  var storage = info.data.storageQuota.usageInDrive;
  if (save_storage_usage == -1)
    save_storage_usage = storage;
  if (storage <= save_storage_usage) {
    save_storage_usage = storage;
    return false;
  }
  save_storage_usage = storage;
  return true;
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gdrive_commentLastFile(auth, area) {
  const drive = google.drive({version: 'v3', auth});
  
  drive.drives.list({
    auth: auth,
  }, (err, drive_list) => {
    if (err) {
      console.log('An error occured with Google Drive service: ' + err);
      return;
    }
    var last_drive = drive_list.data.files;
    if (last_drive.length) {
      drive.comments.create({
        fileId : last_drive[0].id,
        requestBody: {
          content: "Ceci est un document de qualité supérieure!"
        }
      });
    }
  });
}

function gdrive_addGoogleDoc(auth, area) {
  const drive = google.drive({version: 'v3', auth});
    
  drive.files.create({
    auth: auth,
    requestBody: {
      name: "Area secret document",
      mimeType: "application/vnd.google-apps.document"
    }
  });
}



module.exports = {gdrive_detectNewFile, gdrive_commentLastFile, gdrive_addGoogleDoc}