const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function gcalendar_createEvent(auth, area) {
  calendar = google.calendar({version: 'v3', auth});
  actual_date = (new Date()).toISOString().substring(0, 19);
  var event_desc = {
    'summary': 'Réunion area',
    'location': 'At home',
    'description': 'An event to speak about the project',
    'start': {
      'dateTime': actual_date + '-01:00',
      'timeZone': "Europe/Paris",
    },
    'end': {
      'dateTime': actual_date + '-02:00',
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

function addHoursToDate(date, add_hours)
{
  hours = parseInt(date.substring(11,13), 10);
  hours = hours + add_hours;
  add_day = 0;
  day = parseInt(date.substring(8,10), 10);
  while (hours > 23) {
    hours = hours-24;
    add_day = add_day + 1;
  }
  day = day + add_day;
  day = day.toString();
  hours = hours.toString();
  if (hours.length == 1)
    hours = '0' + hours;
  if (day.length == 1)
    day = '0' + day;
  return (date.substring(0,8) + day + "T" + hours + date.substring(13, 19))
}

function calcul_date(date, add_hours)
{
  if (date[19] == '.')
    date = date.substring(0,19);
  if (date[19] == '+') {
    add_hours = add_hours - parseInt(date.substring(20,22), 10);
    date = addHoursToDate(date.substring(0,19), add_hours);
  }
  if (date[19] == '-') {
    add_hours = add_hours + parseInt(date.substring(20,22), 10);
    date = addHoursToDate(date.substring(0,19), add_hours);
  }
  return date;
}

/**
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const gcalendar_oneHourToNext = async (auth, area) => {
  const calendar = google.calendar({version: 'v3', auth});
  var events = await calendar.events.list({
    calendarId: 'primary',
    timeMin: (new Date()).toISOString(),
    maxResults: 3,
    singleEvents: true,
    orderBy: 'startTime',
  });
  events = events.data.items;
  if (events.length) {
    console.log('Upcoming 10 events:');
    for (var i = 0; i < events.length; i++) {
      var start = events[i].start.dateTime || events[i].start.date;
      if (calcul_date(start, -1).substring(0, 16) === calcul_date((new Date()).toISOString(), 0).substring(0, 16))
        return true;
    }
    return false;
  } else {
    return false;
  }
}

module.exports = {gcalendar_createEvent, gcalendar_oneHourToNext}