# Getting Started with Create Server

This project was created in JavaScript with node and express.

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the server in the development mode.\
Open [http://localhost:8080](http://localhost:8080) to view it in the browser.

You will also see any lint errors in the console.

### Use server

Checkout [API REST Documentation](../Documentations/Documentation_api_rest_Area1.3.2.pdf) to read the list of the roots and how use them

### Add actions / réactions

You can add actions by adding a function in the list 'actFuncList' [Here](src/area/actionsFunc.js) that takes an 'area' ({id, user_id, action_id, action_desc, reaction_id, reaction_desc}) and call the reactionAct(area) if the action is activate.

You can add reactions by adding a function in the list 'reactFuncList' [Here](src/area/reactionsFunc.js) that takes an 'area' ({id, user_id, action_id, action_desc, reaction_id, reaction_desc}).