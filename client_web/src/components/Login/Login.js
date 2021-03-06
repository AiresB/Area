import React, { useState } from 'react';
import PropTypes from 'prop-types';

import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import Link from '@material-ui/core/Link';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';

import GoogleBtn from '../Google/Google'
import { useHistory } from 'react-router-dom';

import '../Dashboard/Style.css'

const useStyles = makeStyles((theme) => ({
  root: {
    height: '100vh',
  },
  image: {
    backgroundImage: 'url(https://www.colorhexa.com/34314c.png)',
    backgroundRepeat: 'no-repeat',
    backgroundColor:
      theme.palette.type === 'light' ? theme.palette.grey[50] : theme.palette.grey[900],
    backgroundSize: 'cover',
    backgroundPosition: 'center',
  },
  paper: {
    margin: theme.spacing(8, 4),
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
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

async function loginUser(credentials) {
  if (credentials) {
    try {
      return fetch('http://127.0.0.1:8080/user/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(credentials)
      })
        .then(data => data.json())
        .then(data => {
          console.log(data)
          return (data)
        })
        .catch((err) => {
          console.error(err);
        })
    } catch(e) {
      console.error(e)
    }
  }
}

export default function Login({ setUserID, setUserName }) {
  const classes = useStyles();
  const [email, setEmail] = useState();
  const [password, setPassword] = useState();
  let history = useHistory();

  async function registerUser(data) {
    return fetch('http://127.0.0.1:8080/user/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    .then(data => data.json())
    .then(data => {
      return (data)
    })
      .catch((err) => {
        console.error(err);
      })
   }
  async function loginGoogleUser(credentials) {
      try {
        return fetch('http://127.0.0.1:8080/user/login', {
          method: 'POST',
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
  async function handleGoogleLogin(data) {
    var response = await loginGoogleUser({email: data.profileObj.email, google: data.tokenObj});
    
    console.log(response);
    if (response.error === true) {
      response = await registerUser({email: data.profileObj.email, username: data.profileObj.name, google: data.tokenObj});
    }
    sessionStorage.setItem('userId', response.user.id);
    sessionStorage.setItem('username', response.user.username);
    sessionStorage.setItem('google', true);
    history.push("/dashboard");
    history.go(0);
  }

  const handleSubmit = async e => {
    e.preventDefault();
    const data = await loginUser({
      email,
      password
    });
    if (data.error === true)
      alert("Email or password incorrect");
    if (data.error === false) {
      setUserID(data.user.id);
      setUserName(data.user.username);
      sessionStorage.setItem('google', false);
      console.log(data.user.username);
      history.push("/dashboard");
      history.go(0);
    }
  }

  return(
    <Grid container component="main" className={classes.root}>
      <CssBaseline />
      <Grid item xs={false} sm={4} md={7} className={classes.image} />
      <Grid item xs={12} sm={8} md={5} component={Paper} elevation={6} square>
        <div className={classes.paper}>
          <img src="/Logo.png" alt="logo"></img>
          <Typography component="h1" variant="h5" style={{fontFamily: "Quicksand", fontSize: 35}}>
            Area Sign In
          </Typography>
          <form className={classes.form} onSubmit={handleSubmit}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="email"
              label="Email Address"
              name="email"
              autoComplete="email"
              autoFocus
              onChange={e => setEmail(e.target.value)}
            />
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              name="password"
              label="Password"
              type="password"
              id="password"
              autoComplete="current-password"
              onChange={e => setPassword(e.target.value)}
            />
            <Button
              type="submit"
              fullWidth
              variant="contained"
              color="primary"
              className={classes.submit}
            >
              Sign In
            </Button>
            </form>
            <GoogleBtn handleGoogleLogin={handleGoogleLogin}/>
            <Grid container>
              <Grid item>
                <Link href="/register" variant="body2">
                  {"Don't have an account? Sign Up"}
                </Link>
              </Grid>
            </Grid>
        </div>
      </Grid>
    </Grid>
  )
}

Login.propTypes = {
    setUserID: PropTypes.func.isRequired
}