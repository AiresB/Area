import GoogleBtn from "../Google/Google"
import React from 'react';

import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import Divider from '@material-ui/core/Divider';
import CssBaseline from '@material-ui/core/CssBaseline';
import IconButton from '@material-ui/core/IconButton';
import HomeIcon from '@material-ui/icons/Home';
import SettingsIcon from '@material-ui/icons/Settings';
import ExitToAppIcon from '@material-ui/icons/ExitToApp';
import GetAppIcon from '@material-ui/icons/GetApp';
import { MuiThemeProvider, createMuiTheme, makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Paper from '@material-ui/core/Paper'

import { useHistory } from "react-router-dom";

const theme = createMuiTheme({
  palette: {
    background: {
      default: "#34314C"
    }
  }
});

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    overflow: 'hidden',
    padding: theme.spacing(0, 3),
  },
  divider: {
    margin: theme.spacing(2, 0),
  },
  paperNav: {
    margin: 15,
    padding: 10,
    display: "flex",
    justifyContent: 'space-evenly',
    marginTop: 15,
    width: 600,
    height: 70,
    backgroundColor: '#47B8E0',
    borderRadius: 80,
  }
}));

async function updatePassword(credentials) {
  console.log("UPDATE PASSWORD COMING SOON");
}

async function updateGoogleUser(credentials) {
  try {
      return fetch('http://127.0.0.1:8080/user/update', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(credentials)
      })
        .then(data => data.json())
        .then(data => {
          return (data)
        })
        .catch((err) => {
          console.error(err);
        })
    } catch(e) {
      console.error(e)
    }
}

export default function Preferences() {
  const classes = useStyles();
  var username = sessionStorage.getItem('username').replace("\"", "").replace("\"", "");
  let history = useHistory();
  let userId = sessionStorage.getItem('userId').replace("\"", "").replace("\"", "");
  const [password, setPassword] = React.useState();

  function Logout() {
    sessionStorage.clear("userID");
    sessionStorage.clear("username");
    history.push("/");
    history.go(0);
  }

  async function handleGoogleLogin(data) {
    var response = await updateGoogleUser({id: userId, username: username, email: data.profileObj.email, google: data.tokenObj });
    if (response.error === true) {
     alert("Google account link failed");
    } 
    if (response.error === false) {
      alert("Google account successfully linked");
      sessionStorage.setItem('google', true);
    }
  }

  const handleSubmit = async e => {
    e.preventDefault();
    if (password === null)
      alert("Cannot submit empty password");
    else {
      const data = await updatePassword({
        userId,
        password
      });
      if (data.error === false)
        alert("Password successfully updated!");
      if (data.error === true)
        alert("Password update failed!")
    }
  }
  return(
    <Grid>
      <Grid className={classes.root}>
        <MuiThemeProvider theme={theme}>
          <CssBaseline>
            <div className="container">
              <img src="/Logo.png" alt="logo" style={{ padding: 15, display: 'flex' }} />
              <h1 className="item" style={{ fontFamily: "Quicksand", color: "#FFFFFF", alignSelf: "center", marginLeft: 15}}>Welcome, {username}</h1>
              <Paper className={classes.paperNav}>
              <IconButton style={{marginLeft: 30}} href="/dashboard">
                <HomeIcon fontSize="large"/>
              </IconButton>
              <IconButton style={{marginLeft: 30}} href="/preferences">
                <SettingsIcon fontSize="large"/>
              </IconButton>
              <IconButton style={{marginLeft: 30}} href="/client.apk">
                <GetAppIcon fontSize="large"/>
              </IconButton>
              <IconButton style={{marginLeft: 30}} onClick={Logout}>
                <ExitToAppIcon fontSize="large"/>
              </IconButton>
              </Paper>
            </div>
          </CssBaseline>
        </MuiThemeProvider>
      </Grid>
      <h2 style={{ fontSize: 30, fontFamily: "Quicksand", color: "#FFFFFF", marginLeft: 15}}>Settings</h2>

      <form onSubmit={handleSubmit}>
      <TextField
          id="standard-password-input"
          label="Password"
          type="password"
          autoComplete="current-password"
          style={{
            margin: 10,
            minWidth: 100,
          }}
          onChange={setPassword}
        />
        <Button
          type="submit"
          style={{
            minWidth: 120,
            margin: 20,
            marginLeft: 25,
          }}
          variant="contained"
          color="primary"
        >
          Update
              </Button>
      </form>
      <div style={{
        minWidth: 120,
        margin: 20,
        marginLeft: 25,
      }}>
        <GoogleBtn handleGoogleLogin={handleGoogleLogin} />
      </div>

      <Divider className={classes.divider} />
    </Grid>
  );
}