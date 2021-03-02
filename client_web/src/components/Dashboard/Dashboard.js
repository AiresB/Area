import React , { Component } from 'react';
import { useHistory } from 'react-router-dom';

import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import { makeStyles } from '@material-ui/core/styles';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';
import ListItem from '@material-ui/core/ListItem';
import List from '@material-ui/core/List';
import ListItemText from '@material-ui/core/ListItemText';
import Collapse from '@material-ui/core/Collapse';
import ExpandLess from '@material-ui/icons/ExpandLess';
import ExpandMore from '@material-ui/icons/ExpandMore';
import ListSubheader from '@material-ui/core/ListSubheader';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';


const theme = createMuiTheme({
  palette: {
    background: {
      default: "#34314C"
    }
  }
});

class AreaList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      open: true,
      areaList: [],
      selectedIndex: ''
    }
    this.classes = makeStyles((theme) => ({
      root: {
        width: '100%',
        maxWidth: 360,
        backgroundColor: theme.palette.background.paper,
      },
      nested: {
        paddingLeft: theme.spacing(4),
      },
      formControl: {
        margin: theme.spacing(1),
        minWidth: 120,
      }
    }));
    this.handleClick = this.handleClick.bind(this);
  }
  fetchAreaList() {
    var userId = sessionStorage.getItem('userId');
    fetch('http://127.0.0.1:8080/area/getbyid', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({userId: userId})
    })
      .then(data => data.json())
      .then(data => {
        //this.setState({areaList: data.areas})
        // this.props.areaList = data.areas;
        console.log(data.areas);
      })
      .catch((err) => {
        console.error(err);
      })
  }
  handleClick = (index) => {
    if (this.state === false)
      this.setState({open: true});
    else
      this.setState({open: false});
  };
  componentDidMount() {
    this.fetchAreaList();
  }
  render() {
    return (
      // <List
      //   component="nav"
      //   aria-labelledby="nested-list-subheader"
      //   subheader={
      //     <ListSubheader component="div" id="AREAs">
      //       AREAs
      //   </ListSubheader>
      //   }
      //   className={this.classes.root}
      // >
      //   <ListItem button onClick={this.handleClick}>
      //     <ListItemText primary={this.props.areaID} />
      //     {this.state.open ? <ExpandLess /> : <ExpandMore />}
      //   </ListItem>
      //   <Collapse in={this.state.open} timeout="auto" unmountOnExit>
          // <List component="div" disablePadding>
          //   <ListItem button className={this.classes.nested}>
          //     <ListItemText primary={this.props.actionID} />
          //     <ListItemText primary={this.props.actionDesc} />
          //   </ListItem>
          //   <ListItem button className={this.classes.nested}>
          //     <ListItemText primary={this.props.reactionID} />
          //     <ListItemText primary={this.props.reactionDesc} />
          //   </ListItem>
          // </List>
      //   </Collapse>
      // </List>
      <List
        component="nav"
        aria-labelledby="nested-list-subheader"
        subheader={
          <ListSubheader component="div" id="AREAs">
            AREAs
        </ListSubheader>
        }
        className={this.classes.root}
      >
        { Object.keys(this.state.areaList).map((index) =>
          <div key={index} className="areaList">
            <ListItem button={true} onClick={this.handleClick(index)}>
              <ListItemText primary={this.state.areaList[index].id} />
              {index === this.state.selectedIndex ? <ExpandLess /> : <ExpandMore />}
            </ListItem>
            <Collapse in={index === this.state.selectedIndex} timeout="auto" unmountOnExit>
              <List component="div" disablePadding>
                <ListItem button className={this.classes.nested}>
                  <ListItemText primary={this.state.areaList[index].action_id} />
                  <ListItemText primary={this.state.areaList[index].action_desc} />
                </ListItem>
                <ListItem button className={this.classes.nested}>
                  <ListItemText primary={this.state.areaList[index].reaction_id} />
                  <ListItemText primary={this.state.areaList[index].reaction_desc} />
                </ListItem>
              </List>
            </Collapse>
          </div>
        )}
      </List>
    );
  }
}

class AreaForm extends Component  {
  constructor(props) {
    super(props);
    this.classes = makeStyles((theme) => ({
      root: {
        width: '100%',
        maxWidth: 360,
        backgroundColor: theme.palette.background.paper,
      },
      nested: {
        paddingLeft: theme.spacing(4),
      },
      formControl: {
        margin: theme.spacing(1),
        minWidth: 500,
      },
      submit: {
        margin: theme.spacing(3, 0, 2),
      },
    }));
    this.state = {
      actionList: [],
      reactionList: [],
      actionID: 0,
      reactionID: 0,
      actionDesc: '',
      reactionDesc: ''
    };
    this.handleChangeAction = this.handleChangeAction.bind(this);
    this.handleChangeReaction = this.handleChangeReaction.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  fetchActionList() {
    fetch('http://127.0.0.1:8080/area/actionlist', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      },
    })
      .then(data => data.json())
      .then(data => {
        this.setState({actionList: data.actions})
      })
      .catch((err) => {
        console.error(err);
      })
  }
  fetchReactionList() {
    fetch('http://127.0.0.1:8080/area/reactionlist', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      },
    })
      .then(data => data.json())
      .then(data => {
        this.setState({reactionList: data.reactions})
      })
      .catch((err) => {
        console.error(err);
      })
  }
  componentDidMount() {
    this.fetchActionList();
    this.fetchReactionList();
  }
  
  async handleChangeAction(event) {
    await this.setState({actionID: event.target.value});
  }
  async handleChangeReaction(event) {
    await this.setState({reactionID: event.target.value});
  }
  handleSubmit(event) {
      try {
        fetch('http://127.0.0.1:8080/area/create', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            userId: sessionStorage.getItem('userId'),
            actionId: this.state.actionID,
            actionDesc: "action description",
            reactionId: this.state.reactionID,
            reactionDesc: "reaction description"
          })
        })
          .then(data => data.json())
          .then(data => {
            if (data.error === true)
              alert("AREA creation failed");
            if (data.error === false)
              alert("AREA successfully created");
            console.log(data);
          })
          // .then(response => {
          //   response.json();
          // })
          // .then(data => {
          //   console.log(data);
          // })
          // .catch((err) => {
          //   console.error(err);
          // });
      } catch(e) {
        console.error(e)
      }
      event.preventDefault();
    }
  render() {
    return (
    <div>
      <Grid 
      justify="space-between"
      container 
      spacing={24}
      >
      <form onSubmit={this.handleSubmit}>
      <FormControl style={{minWidth: 300}}>
      <InputLabel htmlFor="grouped-select">Action</InputLabel>
        <Select defaultValue="" id="grouped-select" onChange={this.handleChangeAction}>
            {Object.keys(this.state.actionList).map((index) => {
              return <MenuItem key={index} value={index}>{this.state.actionList[index]}</MenuItem>
            })}
        </Select>
      </FormControl>
      <FormControl style={{minWidth: 300}}>
        <InputLabel htmlFor="grouped-select">Reaction</InputLabel>
        <Select defaultValue="" id="grouped-select" onChange={this.handleChangeReaction}>
            {Object.keys(this.state.reactionList).map((index) => {
              return <MenuItem key={index} value={index}>{this.state.reactionList[index]}</MenuItem>
            })}
        </Select>
      </FormControl>
      <Button
              type="submit"
              style={{minWidth: 120}}
              variant="contained"
              color="primary"
            >
              Create
            </Button>
      </form>
      </Grid>
    </div>

    );
  }
}

export default function Dashboard() {
  let history = useHistory();
  var username = sessionStorage.getItem('username').replace("\"", " ").replace("\"", " ");
  var areaList = [];
  const [anchorEl, setAnchorEl] = React.useState(null);

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
        <AreaForm/>      
      <AreaList areaList={areaList}/>
      </Grid>
  );
}