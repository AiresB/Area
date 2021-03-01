import React from 'react';
import { useHistory } from 'react-router-dom';

import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import ExitToAppIcon from '@material-ui/icons/ExitToApp';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';

const theme = createMuiTheme({
  palette: {
    background: {
      default: "#34314C"
    }
  }
});


export default function Dashboard() {
  let history = useHistory();
  var username = sessionStorage.getItem('username').replace("\"", " ").replace("\"", " ");
  function Logout() {
    sessionStorage.clear("token");
    history.push("/");
    history.go(0);
  }
  return (
    <Grid>
      <MuiThemeProvider theme={theme}>
      <CssBaseline>
        <ExitToAppIcon fontSize="large">
        </ExitToAppIcon>
        <Button onClick={Logout}>Log out</Button>
        <h2>Dashboard</h2>
        <h2>Welcome, { username }</h2>
      </CssBaseline>
      </MuiThemeProvider>
    </Grid>

  );
}