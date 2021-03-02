import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import Dashboard from '../Dashboard/Dashboard';
import Login from '../Login/Login';
import Preferences from '../Preferences/Preferences';
import Register from '../Register/Register'


function setUserID(userID) {
  sessionStorage.setItem('userId', JSON.stringify(userID));
}

function getUserID() {
  const tokenString = sessionStorage.getItem('userId');
  return tokenString
}

function setUser(user) {
  sessionStorage.setItem('username', JSON.stringify(user))
}

function App() {
  const token = getUserID();
  if(!token) {
    return (
      <BrowserRouter>
      <Switch>
        <Route exact path = "/"><Login setUserID={setUserID} setUserName={setUser}/></Route>
        <Route path = "/register"><Register/></Route>
      </Switch>
      </BrowserRouter>
    );
  } else {
    return (
        <BrowserRouter>
          <Switch>
            <Route path="/dashboard">
              <Dashboard />
            </Route>
            <Route path="/preferences">
              <Preferences />
            </Route>
          </Switch>
        </BrowserRouter>
    );
  }
}

export default App;
