<h1 align="center"> Welcome to AREA </h1>

## Before installing

```sh
# Clone the repository
git clone git@github.com:EpitechIT2020/B-YEP-500-PAR-5-1-area-adrien.mollat.git
# Make sure to create 2 .env files, one in /client_web the other one in /server

# .env in client

cat /client_web/.env

REACT_APP_GOOGLE_CLIENT_ID= [id]

# .env in server

cat /server/.env
PORT= [SERVER PORT]
PGHOST= [POSTGRES HOST]
PGUSER= [POSTGRES USER]
PGPASSWORD= [POSTGRES PASSWORD]
PGDATABASE= [POSTGRES DATABASE]
PGPORT= [POSTGRES PORT]

```
<p>Learn how to get your Google client id <a href="https://developers.google.com/identity/one-tap/web/guides/get-google-api-clientid">here</a></p>
<p>Docker and docker-compose are required, install them <a href="https://docs.docker.com/get-docker/">here</a></p>

## Installing and running client

```sh
docker-compose up --build
```

## Accessing the web client

<p>You can access the web client on the address http://localhost:8081/</p>

## Accessing the server

<p>You can access the server on the address http://localhost:8080/</p>


## Services

<p>We currently have 8 services: </p>

<ol>
<li>GMail</li>
<li>Google Calendar</li>
<li>Google Drive</li>
<li>Youtube</li>
<li>Weather</li>
<li>Time</li>
<li>Sunrise-sunset</li>
<li>Holidays</li>
</ol>

## Actions/Triggers :
### Hour: It's 8 o'clock
#### Description : Activate each morning at 8 o'clock
### Gmail: Detect a new email in the box
#### Description : Activate when user receive an email
### GCalendar: An event in the calendar is detected at this moment
#### Description : Activate when an event start
### Youtube: I got a subscriber
#### Description : Activate when the user got a new subscriber
### GDrive: Detect a new file into the drive
#### Description : Activate when the user create a new file
### Weather: It's raining
#### Description : Activate when it start to rain
### Sunrise: We are in the sunrise hour
#### Description : Activate at sunrise
### Sunset: We are in the sunset hour
#### Description : Activate at sunset
### Holidays
#### Description : Activate each morning during the french holidays

## Reactions :
### Gmail: Send an email
#### Description : Send an email when activate
### GCalendar: Create an event 1 hour later
#### Description : Create an event 1 hour later the activation
### Youtube: Like the TOP 1 Popular FR video
#### Description : Like the TOP 1 Popular FR video
### GDrive: Comment the last file pushed into the drive
#### Description : Comment the last file pushed into the drive
### Youtube: Put the TOP 1 Popular FR video in a Playlist
#### Description : Put the TOP 1 Popular FR video in a Playlist
### GDrive: Create an empty google doc into the drive
#### Description : Create an empty google doc file into the drive

## Web Client
### Register accoount
#### Users can register a new account or with a Google account
![Register](https://user-images.githubusercontent.com/67512526/110232274-10f1e700-7f1d-11eb-8292-6d392c866983.png)

### Login
#### Users can login with registered email and password or through Google
![Login](https://user-images.githubusercontent.com/67512526/110232233-de47ee80-7f1c-11eb-971e-a9ecaee28be9.png)

### Google authorization
#### Users will have to give Google permission to create AREAs
![GoogleAuth](https://user-images.githubusercontent.com/67512526/110232307-27983e00-7f1d-11eb-8fca-d613ef88d93e.png)

### Dashboard
#### Once logged in, users will have access to the dashboard to view created AREAs
![DashboardEmpty](https://user-images.githubusercontent.com/67512526/110232306-26671100-7f1d-11eb-8bc3-19bcf2c41ba0.png)

#### User can create AREAs and will receive a pop up if the AREA has been succesfully created or failed
![DashboardAreaCreated](https://user-images.githubusercontent.com/67512526/110232310-28c96b00-7f1d-11eb-8cae-4be185c69b4c.png)
![DashboardAreaFailed](https://user-images.githubusercontent.com/67512526/110232604-f882cc00-7f1e-11eb-9605-8c95b0e3237e.png)
![DashboardArea](https://user-images.githubusercontent.com/67512526/110232309-2830d480-7f1d-11eb-898f-36acaad8c3fe.png)

#### Users can delete AREAs by clicking on the bin next to the AREA card
![DeleteArea](https://user-images.githubusercontent.com/67512526/110232864-a93d9b00-7f20-11eb-89cb-314cc3f16d61.png)

### Settings
#### Users can accesss the settings page on the second icon on the top right corner
#### On the settings page, users can add Google account if it has not been done
![Settings](https://user-images.githubusercontent.com/67512526/110232308-27983e00-7f1d-11eb-8aac-2504de3a1646.png)

### Download Mobile app
#### Users can download the mobile app for android on the third icon on the top right corner
![downloadApk](https://user-images.githubusercontent.com/67512526/110232770-23b9eb00-7f20-11eb-8b7e-56a7f5d44913.png)

### Log out
#### Users can log out of AREA on the fourth icon on the top right corner
![downloadApk](https://user-images.githubusercontent.com/67512526/110232832-74c9df00-7f20-11eb-8f77-1f1f59d70096.png)

## More

### Technologies uses
#### Technologies explaination at [Technologies](Documentations/Technologies.pdf)

### Gitflow
#### Checkout our [Gitflow](Documentations/Gitflow.pdf)

### Documentation Api
#### You can use our serveur with your own client by calling our REST api
#### Go to [Documentation API](Documentations/Documentation_api_rest_Area1.3.2.pdf) to see the roots

## Tests Policy
### API REST: [Postman collection](server/tests/Area.postman_collection.json)
### tiers API: Postman
### mobile_client: manual tests
### web_client: manual tests