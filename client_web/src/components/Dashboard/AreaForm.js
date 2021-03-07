import React, { Component } from 'react';

import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';
import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import MenuItem from '@material-ui/core/MenuItem';

class AreaForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      actionID: 0,
      reactionID: 0,
      actionDesc: '',
      reactionDesc: '',
    };
    this.handleChangeAction = this.handleChangeAction.bind(this);
    this.handleChangeReaction = this.handleChangeReaction.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  async handleChangeAction(event) {
    this.setState({ actionID: event.target.value });
  }
  async handleChangeReaction(event) {
    this.setState({ reactionID: event.target.value });
  }

  async handleSubmit(event) {
    event.preventDefault();
    if (sessionStorage.getItem('google') === "false") {
      alert("Please sign in to Google to create this AREA");
    } else {
      try {
        await fetch('http://127.0.0.1:8080/area/create', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            userId: sessionStorage.getItem('userId').replace("\"", "").replace("\"", ""),
            actionId: this.state.actionID,
            actionDesc: "null",
            reactionId: this.state.reactionID,
            reactionDesc: "null"
          })
        })
          .then(data => data.json())
          .then(data => {
            if (data.error === true)
              alert("AREA creation failed");
            if (data.error === false) {
              alert("AREA successfully created");
              this.props.addArea(data.area);
            }
          })
      } catch (e) {
        console.error(e)
      }
    }
  }
  render() {
    return (
      <div>
        <Grid
          container
        >
          <form onSubmit={this.handleSubmit}>
            <FormControl
              style={{
                margin: 10,
                minWidth: 300,
              }}>
              <InputLabel htmlFor="grouped-select">Action</InputLabel>
              <Select defaultValue="" id="grouped-select" onChange={this.handleChangeAction}>
                {Object.keys(this.props.actionList).map((index) => {
                  return <MenuItem key={index} value={index} >{this.props.actionList[index]}</MenuItem>
                })}
              </Select>
            </FormControl>
            <FormControl
              style={{
                margin: 10,
                minWidth: 300,
              }}
            >
              <InputLabel htmlFor="grouped-select">Reaction</InputLabel>
              <Select defaultValue="" id="grouped-select" onChange={this.handleChangeReaction}>
                {Object.keys(this.props.reactionList).map((index) => {
                  return <MenuItem key={index} value={index} >{this.props.reactionList[index]}</MenuItem>
                })}
              </Select>
            </FormControl>
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
              Create
              </Button>
          </form>
        </Grid>
      </div>

    );
  }
}

export default AreaForm