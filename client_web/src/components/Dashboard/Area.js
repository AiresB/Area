import React, { Component } from "react";
import { Delete, Build } from "@material-ui/icons";
import { Grid, Paper } from "@material-ui/core";
import IconButton from "@material-ui/core/IconButton";
import Typography from '@material-ui/core/Typography';

const styles = {
  Icon: {
    marginLeft: "auto"
  },
  Paper: {
    margin: "auto",
    padding: 10,
    display: "flex",
    alignItems: "left",
    marginTop: 10,
    width: 500
  },
  Area: {
    display: 'block'
  },
  root: {
    flexGrow: 1,
    overflow: 'hidden',
    padding: 10,
  }
};

class Area extends Component {
  state = {
    fade: false
  };

  gridRef = React.createRef();

  deleteArea = () => {
    const fade = true;
    this.setState({ fade });

    var promise = new Promise(function(resolve, reject) {
      setTimeout(function() {
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
                    className={`${gridClass}`}
                    item
                    key={this.props.index}
                    ref={this.gridRef}
                >
                    <Paper elevation={2} style={styles.Paper}>
                        <Grid container spacing={2}>
                            <Grid item>
                                <Typography gutterBottom variant="subtitle1">
                                    AREA ID : {this.props.area.id}
                                </Typography>
                            </Grid>
                            <Grid item>
                                <Typography gutterBottom >
                                    Action : {this.props.actionList[this.props.area.action_id]}
                                </Typography>
                            </Grid>
                            <Grid item>
                                <Typography gutterBottom >
                                    Reaction : {this.props.reactionList[this.props.area.reaction_id]}
                                </Typography>
                            </Grid>
                        </Grid>

                        <IconButton
                            color="primary"
                            aria-label="Edit"
                            style={styles.Icon}
                            onClick={() => this.props.updateArea(this.props.index)}
                        >
                            <Build fontSize="small" />
                        </IconButton>
                        <IconButton
                            color="secondary"
                            aria-label="Delete"
                            onClick={this.deleteArea}
                        >
                            <Delete fontSize="small" />
                        </IconButton>
                    </Paper>
                </Grid>
            </div>
        );
    }
}

export default Area;