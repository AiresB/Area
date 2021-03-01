const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');


/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gcalendar_createEvent(auth) {
  calendar = google.calendar({version: 'v3', auth});
  var event_desc = {
    'summary': 'Réunion area',
    'location': 'At home',
    'description': 'An event to speak about the project',
    'start': {
      'dateTime': '2021-03-02T19:00:00+01:00',
      'timeZone': "Europe/Paris",
    },
    'end': {
      'dateTime': '2021-03-02T20:00:00+01:00',
      'timeZone': "Europe/Paris",
    },
    'recurrence': [
      'RRULE:FREQ=DAILY;COUNT=1'
    ],
    'reminders': {
      'useDefault': false,
      'overrides': [
        {'method': 'email', 'minutes': 24 * 60},
        {'method': 'popup', 'minutes': 10},
      ],
    },
  };
  
  calendar.events.insert({
    auth: auth,
    calendarId: 'primary',
    resource: event_desc,
  }, function(err, event) {
    if (err) {
      console.log('An error occured with Calendar service: ' + err);
      return;
    }
    console.log('Event created: %s', event.htmlLink);
  });
  
}


/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gcalendar_listEvents(auth) {
  const calendar = google.calendar({version: 'v3', auth});
  calendar.events.list({
    calendarId: 'primary',
    timeMin: (new Date()).toISOString(),
    maxResults: 10,
    singleEvents: true,
    orderBy: 'startTime',
  }, (err, res) => {
    if (err) return console.log('The API returned an error: ' + err);
    const events = res.data.items;
    if (events.length) {
      console.log('Upcoming 10 events:');
      events.map((event, i) => {
        const start = event.start.dateTime || event.start.date;
        console.log(`${start} - ${event.summary}`);
      });
    } else {
      console.log('No upcoming events found.');
    }
  });
}

module.exports = {gcalendar_createEvent, gcalendar_listEvents}