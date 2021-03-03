import React, { Component } from 'react';

import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button';
import MenuItem from '@material-ui/core/MenuItem';



class AreaForm extends Component {
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
      actionID: 0,
      reactionID: 0,
      actionDesc: '',
      reactionDesc: ''
    };
    this.handleChangeAction = this.handleChangeAction.bind(this);
    this.handleChangeReaction = this.handleChangeReaction.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  async handleChangeAction(event) {
    await this.setState({ actionID: event.target.value });
  }
  async handleChangeReaction(event) {
    await this.setState({ reactionID: event.target.value });
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
          actionDesc: "action_desc",
          // actionDesc: this.props.actionList[this.state.actionID],
          reactionId: this.state.reactionID,
          reactionDesc: "reaction_desc"
          // reactionDesc: this.props.reactionList[this.state.reactionID]
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
    event.preventDefault();
  }
  render() {
    return (
      <div>
        <Grid
          justify="space-between"
          container
          spacing={10}
        >
          <form onSubmit={this.handleSubmit}>
            <FormControl style={{ minWidth: 300 }}>
              <InputLabel htmlFor="grouped-select">Action</InputLabel>
              <Select defaultValue="" id="grouped-select" onChange={this.handleChangeAction}>
                {Object.keys(this.props.actionList).map((index) => {
                  return <MenuItem key={index} value={index} >{this.props.actionList[index]}</MenuItem>
                })}
              </Select>
            </FormControl>
            <FormControl style={{ minWidth: 300 }}>
              <InputLabel htmlFor="grouped-select">Reaction</InputLabel>
              <Select defaultValue="" id="grouped-select" onChange={this.handleChangeReaction}>
                {Object.keys(this.props.reactionList).map((index) => {
                  return <MenuItem key={index} value={index} >{this.props.reactionList[index]}</MenuItem>
                })}
              </Select>
            </FormControl>
            <Button
              type="submit"
              style={{ minWidth: 120 }}
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