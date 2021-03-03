import React, { Component } from 'react';

import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper';

import Area from './Area'
// import EditArea from './EditArea'
const classes = {
  Paper: {
    margin: "auto",
    padding: 10,
    display: "flex",
    alignItems: "left",
    marginTop: 10,
    width: 500
  }
}
class AreaList extends Component {
    renderArea = key => {
        // if (this.props.areaList[key]["status"] === "active") {
        //   return (
        //     <Area
        //       key={key}
        //       index={key}
        //       todo={this.props.areaList[key]["todo"]}
        //       deleteTodo={this.props.deleteTodo}
        //       updateTodo={this.props.updateTodo}
        //     />
        //   );
        // } else if (this.props.list[key]["status"] === "editing") {
        //   return (
        //     <EditArea
        //       key={key}
        //       index={key}
        //       todo={this.props.list[key]["todo"]}
        //       saveTodo={this.props.saveTodo}
        //     />
        //   );
        return (
            <Area
              key={key}
              index={key}
              actionList={this.props.actionList}
              reactionList={this.props.reactionList}
              area={this.props.areaList[key]}
              deleteArea={this.props.deleteArea}
              updateArea={this.props.updateArea}
            />
          );
      };
    // fetchAreaList() {
    //     var userId = sessionStorage.getItem('userId');
    //     fetch('http://127.0.0.1:8080/area/getbyid', {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json'
    //         },
    //         body: JSON.stringify({ userId: userId })
    //     })
    //         .then(data => data.json())
    //         .then(data => {
    //             console.log(data.areas);
    //         })
    //         .catch((err) => {
    //             console.error(err);
    //         })
    // }
    // componentDidMount() {
    //     this.fetchAreaList();
    // }
    render() {
      console.log(this.props.areaList);
      if (this.props.areaList.length === 0) {
        return (
          <Paper elevation={2} style={classes.Paper}>
            <Grid container spacing={2}>
              <Grid item xs={12}>
                <Paper className={classes.Paper}>No AREAs yet create some!</Paper>
              </Grid>
            </Grid>
          </Paper>
        );
      }
      return (
        <Grid container alignContent='flex-start'>
          {this.props.areaList && Object.keys(this.props.areaList).map(key => this.renderArea(key))}
        </Grid>
      );
    }
}

export default AreaList;