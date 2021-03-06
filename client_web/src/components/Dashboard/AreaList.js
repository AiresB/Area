import React, { Component } from 'react';

import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';

import Area from './Area'
// import EditArea from './EditArea'
const classes = {
  Paper: {
    margin: "auto",
    padding: 10,
    display: "flex",
    alignItems: "left",
    marginTop: 10,
    width: 600,
    height: 300,
    backgroundColor: '#444064',
    borderRadius: 15,
  }
}
class AreaList extends Component {
    renderArea = key => {
      if (this.props.areaList[key]) {
        return (
          <Area
            key={key}
            index={key}
            actionList={this.props.actionList}
            reactionList={this.props.reactionList}
            area={this.props.areaList[key]}
            deleteArea={this.props.deleteArea}
          />
        );
      }
      };
    render() {
      if (this.props.areaList.length === 0) {
        return (
          <Paper elevation={2} style={classes.Paper}>
            <Grid container spacing={2}>
              <Grid item xs={12}>
                <Typography
                  gutterBottom
                  variant="h4"
                  align="center"
                  style={{
                    padding: 50,
                    color: '#FFFFFF',
                    fontFamily: 'Quicksand'
                  }}>
                  No AREAs created!
                </Typography>
              </Grid>
            </Grid>
          </Paper>
        );
      }
      return (
        <Grid container alignContent='flex-start' justify="space-between" spacing={4} style={classes.areaList}>
          {this.props.areaList && Object.keys(this.props.areaList).map(key => this.renderArea(key))}
        </Grid>
      );
    }
}

export default AreaList;