import React , { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';

import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';

import AreaList from './AreaList'
import AreaForm from './AreaForm'



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
  const [areaList, setAreaList] = useState({});
  const [actionList, setActionList] = useState({});
  const [reactionList, setReactionList] = useState({});
  const [anchorEl, setAnchorEl] = React.useState(null);

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
  function Preferences() {
    history.push("/preferences");
    history.go(0);
  }
  function Home() {
    history.push("/dashboard");
    history.go(0);
  }
  function handleClose() {
    setAnchorEl(null);
  }
  function handleClick(event) {
    setAnchorEl(event.currentTarget);
  }

  function addArea(area) {
    let tmpList = { ...areaList };
    var len = Object.keys(tmpList).length + 1;
    tmpList[len + 1] = area;
    setAreaList(tmpList);
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
      tmpList[index] = null;
      setAreaList(tmpList);
  }
  function updateArea(area) {
    console.log("UPDATE: ");
    console.log(area);
  }
  function saveArea(area) {
    console.log("SAVE: ");
    console.log(area);
  }

  return (
    <Grid>
      <MuiThemeProvider theme={theme}>
        <CssBaseline>
          <Button aria-controls="simple-menu" aria-haspopup="true" onClick={handleClick}>
            Menu
      </Button>
          <Menu
            id="simple-menu"
            anchorEl={anchorEl}
            keepMounted
            open={Boolean(anchorEl)}
            onClose={handleClose}
          >
            <MenuItem onClick={Home}>Profile</MenuItem>
            <MenuItem onClick={Preferences}>Settings</MenuItem>
            <MenuItem onClick={Logout}>Logout</MenuItem>
          </Menu>
          <h2>Dashboard</h2>
          <h2>Welcome, {username}</h2>
        </CssBaseline>
      </MuiThemeProvider>
      <Grid container wrap="nowrap" spacing={2}>
        <AreaForm
          addArea={addArea}
          actionList={actionList}
          reactionList={reactionList}
        />
        </Grid>
        <Grid container wrap="nowrap" spacing={2}>
        <AreaList
          areaList={areaList}
          actionList={actionList}
          reactionList={reactionList}
          deleteArea={deleteArea}
          updateArea={updateArea}
          saveArea={saveArea}
        />
      </Grid>
    </Grid>
  );
}