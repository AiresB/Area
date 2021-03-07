import React , { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';

import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper'
import Divider from '@material-ui/core/Divider';
import CssBaseline from '@material-ui/core/CssBaseline';
import IconButton from '@material-ui/core/IconButton';
import HomeIcon from '@material-ui/icons/Home';
import SettingsIcon from '@material-ui/icons/Settings';
import ExitToAppIcon from '@material-ui/icons/ExitToApp';
import GetAppIcon from '@material-ui/icons/GetApp';
import { MuiThemeProvider, createMuiTheme, makeStyles } from '@material-ui/core/styles';

import AreaList from './AreaList'
import AreaForm from './AreaForm'
import './Style.css'


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
  paper: {
    maxWidth: 400,
    margin: `${theme.spacing(1)}px auto`,
    padding: theme.spacing(2),
  },
  areaForm: {
    backgroundColor: 'white',
    padding: theme.spacing(2),
    margin: 15,
    height: 100,
    borderRadius: 10,
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

export default function Dashboard() {
  let history = useHistory();
  var username = sessionStorage.getItem('username').replace("\"", " ").replace("\"", " ");
  const [areaList, setAreaList] = React.useState([]);
  const [actionList, setActionList] = useState({});
  const [reactionList, setReactionList] = useState({});
  let wrapper = React.createRef();
  const classes = useStyles();

  useEffect(() => {
    async function fetchAreaList() {
      var userId = sessionStorage.getItem('userId');
      fetch('http://127.0.0.1:8080/area/getbyid', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify({ userId: userId })
      })
          .then(data => data.json())
          .then(data => {
              setAreaList(data.areas);
          })
          .catch((err) => {
              console.error(err);
          })
    }
    
    async function fetchActionList() {
      await fetch('http://127.0.0.1:8080/area/actionlist', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        },
      })
        .then(data => data.json())
        .then(data => {
          setActionList(data.actions);
        })
        .catch((err) => {
          console.error(err);
        })
    }
    
    async function fetchReactionList() {
      await fetch('http://127.0.0.1:8080/area/reactionlist', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        },
      })
        .then(data => data.json())
        .then(data => {
          setReactionList(data.reactions);
        })
        .catch((err) => {
          console.error(err);
        })
    }
  
    fetchAreaList();
    fetchActionList();
    fetchReactionList();
  }, [])

  function Logout() {
    sessionStorage.clear("userID");
    sessionStorage.clear("username");
    history.push("/");
    history.go(0);
  }

  function addArea(area) {
    var newArea = {
      action_desc: area.actionDesc,
      action_id: area.actionId,
      id: area.id,
      reaction_desc: area.actionDesc,
      reaction_id: area.reactionId,
      user_id: area.userId
    }
    setAreaList(areaList => [...areaList, newArea]);
  };
  async function deleteArea(index) {
    let tmpList = { ...areaList };
    await fetch('http://127.0.0.1:8080/area/delete', {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ id: areaList[index].id })
    });
    if (Object.keys(tmpList).length === 1) {
      tmpList = [];
    } else
      tmpList[index] = null;
    setAreaList(tmpList);
  }

  return (
    <Grid>
      <Grid className={classes.root}>
        <MuiThemeProvider theme={theme}>
          <CssBaseline>
            <div className="container">
              <img src="/Logo.png" alt="Logo" style={{ padding: 15, display: 'flex' }} />
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
      <Grid >
        <Grid className={classes.areaForm}>
          <AreaForm
          addArea={addArea}
          actionList={actionList}
          reactionList={reactionList}
          ref={wrapper}
        />
      </Grid>
      <h2 style={{ fontSize: 30, fontFamily: "Quicksand", color: "#FFFFFF", marginLeft: 15}}>Created AREAs</h2>
      <Divider className={classes.divider}/>
      <Grid className={classes.paper}>
        <AreaList
          areaList={areaList}
          actionList={actionList}
          reactionList={reactionList}
          deleteArea={deleteArea}
        />
      </Grid>
      </Grid>
    </Grid>
  );
}