import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';

import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import { makeStyles, MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';

import GoogleBtn from "../Google/Google"
import '../Dashboard/Style.css'

const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(8),
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%',
    marginTop: theme.spacing(3),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

const theme = createMuiTheme({
  palette: {
    background: {
      default: "#34314C"
    }
  }
});

async function registerUser(credentials) {
    return fetch('http://127.0.0.1:8080/user/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(credentials)
    })
      .then(function(response) {
        if (response.status === 401)
          alert("Email already used");
        if (response.status === 201)
          alert("User successfully registered");
      })
      .catch((err) => {
        console.error(err);
      })
   }

export default function Register() {
  const [email, setEmail] = useState();
  const [password, setPassword] = useState();
  const [username, setUserName] = useState();
  const classes = useStyles();
  var history = useHistory();

  const handleSubmit = async e => {
    e.preventDefault();
    await registerUser({
      password,
      username,
      email
    });
    history.push("/");
    history.push(0);
  }
  return(
    <Container component="main" maxWidth="xs">
      <MuiThemeProvider theme={theme}>
      <CssBaseline />
      <div className={classes.paper}>
        <img src="/Logo.png" alt="logo"></img>
        <Typography component="h1" variant="h5" style={{fontFamily: "Quicksand", fontSize: 35, color: "#FFFFFF"}}>
          Sign up
        </Typography>
        <form className={classes.form} onSubmit={handleSubmit}>
          <Grid container spacing={2}>
            <Grid item xs={12}>
              <TextField
                autoComplete="uname"
                name="userName"
                variant="outlined"
                required
                fullWidth
                id="userName"
                label="Username"
                autoFocus
                onChange={e => setUserName(e.target.value)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                required
                fullWidth
                id="email"
                label="Email Address"
                name="email"
                autoComplete="email"
                onChange={e => setEmail(e.target.value)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                required
                fullWidth
                name="password"
                label="Password"
                type="password"
                id="password"
                autoComplete="current-password"
                onChange={e => setPassword(e.target.value)}
              />
            </Grid>
          </Grid>
          <Button
            type="submit"
            fullWidth
            variant="contained"
            color="primary"
            className={classes.submit}
          >
            Sign Up
          </Button>
          <GoogleBtn message="Sign in"/>
          <Grid container justify="flex-end">
            <Grid item>
              <Link href="http://localhost:3000/" variant="body2">
                Already have an account? Sign in
              </Link>
            </Grid>
          </Grid>
        </form>
      </div>
      </MuiThemeProvider>
    </Container>
  );
}