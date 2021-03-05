import React, { Component } from "react";
import { Delete } from "@material-ui/icons";
import { Grid, Paper } from "@material-ui/core";
import IconButton from "@material-ui/core/IconButton";
import Typography from '@material-ui/core/Typography';

import './Style.css'

const styles = {
  Icon: {
    marginLeft: "auto"
  },
  Paper: {
    margin: 15,
    padding: 10,
    display: "flex",
    marginTop: 15,
    width: 600,
    height: 300,
    backgroundColor: '#444064',
    borderRadius: 15,
  },
  Area: {
    display: 'block'
  },
  root: {
    flexGrow: 1,
    overflow: 'hidden',
    padding: 10,
  },
  action: {
    backgroundColor: '#FF7473',
    borderRadius: 15,
    width: 200,
    height: 250,
    margin: 20
  },
  reaction: {
    backgroundColor: '#42BB73',
    borderRadius: 15,
    width: 200,
    height: 250,
    margin: 20
  },
};

class Area extends Component {
  state = {
    fade: false
  };

  gridRef = React.createRef();

  deleteArea = () => {
    const fade = true;
    this.setState({ fade });

    var promise = new Promise(function (resolve, reject) {
      setTimeout(function () {
        resolve(true);
      }, 500);
    });

    promise.then(() => this.props.deleteArea(this.props.index));
  };

  render() {
    const gridClass = this.state.fade ? "fade-out" : "";
    return (
      <div className={styles.root}>
        <Grid
          xs={12}
          item={true}
          className={`${gridClass}`}
          key={this.props.index}
          ref={this.gridRef}
        >
          <Paper elevation={2} style={styles.Paper}>
              <Paper style={styles.action}>
                <Typography
                  gutterBottom
                  variant="h4"
                  align="center"
                  style={{
                    padding: 8,
                    color: '#FFFFFF',
                    fontFamily: 'Quicksand'
                  }}>
                  Action
                </Typography>
                <Typography
                  gutterBottom
                  variant="h6"
                  align="center"
                  style={{
                    padding: 40,
                    color: '#FFFFFF',
                    fontFamily: 'Quicksand'
                  }}>
                  {this.props.actionList[this.props.area.action_id]}
                </Typography>
              </Paper>
              <Paper style={styles.reaction}>
                <Typography
                  gutterBottom
                  variant="h4"
                  align="center"
                  style={{
                    padding: 8,
                    color: '#FFFFFF',
                    fontFamily: 'Quicksand',
                  }}>
                  Reaction
                </Typography>
                <Typography
                  gutterBottom
                  variant="h6"
                  align="center"
                  style={{
                    padding: 40,
                    color: '#FFFFFF',
                    fontFamily: 'Quicksand',
                  }}>
                  {this.props.reactionList[this.props.area.reaction_id]}
                </Typography>
              </Paper>
            <IconButton
              color="secondary"
              aria-label="Delete"
              onClick={this.deleteArea}
            >
              <Delete fontSize="large" />
            </IconButton>
          </Paper>
        </Grid>
      </div>
    );
  }
}

export default Area;