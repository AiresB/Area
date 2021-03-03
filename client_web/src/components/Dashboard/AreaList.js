import React, { Component } from 'react';

import Grid from '@material-ui/core/Grid';

import Area from './Area'
// import EditArea from './EditArea'

class AreaList extends Component {
    renderArea = key => {
        if (this.props.areaList[key] == null) return null;
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
        return (
            <Grid container alignContent='flex-start'>
            {this.props.areaList && Object.keys(this.props.areaList).map(key => this.renderArea(key))}
          </Grid>
        );
    }
}

export default AreaList;