import React, { Component } from "react";
import classes from '../css/Widget.module.css';
import Paper from '@material-ui/core/Paper';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import Avatar from '@material-ui/core/Avatar';
import LocationCityIcon from '@material-ui/icons/LocationCity';
import ScheduleIcon from '@material-ui/icons/Schedule';
import CloudQueueIcon from '@material-ui/icons/CloudQueue';
import Divider from '@material-ui/core/Divider';

const api = {
  key: "3ca7ac710975ca6f256d01eabc07f6b0",
  base: "https://api.openweathermap.org/data/2.5/"
};

const dateBuilder = (d) => {
  let months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  let days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  let day = days[d.getDay()];
  let date = d.getDate();
  let month = months[d.getMonth()];
  let year = d.getFullYear();

  return `${day} ${date} ${month} ${year}`;
};

async function getWeatherAPI(query) {
  const res = await fetch (`${api.base}weather?q=${query}&appid=${api.key}`)
  return res
}

class Weather_app extends Component {
  constructor(props) {
    super(props);
    this.timer = this.timer.bind(this);
    this.state = {
      query: undefined,
      weather: {},
      isDelete: false,
      intervalId: 0
    };
  }

  componentDidMount() {
    var intervalId = setInterval(this.timer, 1000);

    this.setState({intervalId: intervalId});
  }

  componentWillUnmount() {
    clearInterval(this.state.intervalId);
  }

  KelvinToDegree(temp) {
    return (temp - 273.15);
  }

  handleClickDelete() {
    this.setState({isDelete: true});
  }

  timer() {
    if (typeof(this.state.query) != undefined) {
      getWeatherAPI(this.state.query)
      .then(res => res.json())
      .then(result =>
      this.setState({query : this.state.query, weather : result} ))
    }
  }

  render() {
    return (
      <div>
      {this.state.isDelete === false ? (
        <Paper elevation={3} className={classes.root} >
          <Button style={{
            backgroundColor: "#DC143C",
            border: "0",
            borderradius: "3",
            boxshadow: "0 3px 5px 2px rgba(255, 105, 135, .3)",
            color: "white",
            height: "auto",
            width: "25px",
          }} variant="contained" onClick={() => this.handleClickDelete()}>X</Button>
          <form className={classes.root} noValidate autoComplete="off">
            <TextField value={this.state.query} style={{ marginBottom: "15px" }} onChange={(e) => this.setState({ query: e.target.value })} id="standard-basic" label="Choose a city" />
          </form>
          {(typeof this.state.weather.main != "undefined") ? (
          <List className={classes.root}>
            <ListItem>
              <ListItemAvatar>
                <Avatar>
                  <LocationCityIcon />
                </Avatar>
              </ListItemAvatar>
              <ListItemText primary={this.state.weather.name} secondary={this.state.weather.sys.country} />
            </ListItem>
            <Divider variant="inset" component="li" />
            <ListItem>
              <ListItemAvatar>
                <Avatar>
                  <ScheduleIcon />
                </Avatar>
              </ListItemAvatar>
              <ListItemText primary={dateBuilder(new Date())} />
            </ListItem>
            <Divider variant="inset" component="li" />
            <ListItem>
              <ListItemAvatar>
                <Avatar>
                  <CloudQueueIcon />
                </Avatar>
              </ListItemAvatar>
              <ListItemText primary={Math.round(this.KelvinToDegree(this.state.weather.main.temp)) + "°C"} secondary={this.state.weather.weather[0].main} />
            </ListItem>
          </List>
          ) : ('')}
        </Paper>
      ) : null}
      </div>
    );
  }
}

export default Weather_app;
