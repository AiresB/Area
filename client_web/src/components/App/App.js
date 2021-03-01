import React from 'react';
import './App.css';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import Dashboard from '../Dashboard/Dashboard';
import Login from '../Login/Login';
import Preferences from '../Preferences/Preferences';
import Register from '../Register/Register'


function setToken(userToken) {
  sessionStorage.setItem('token', JSON.stringify(userToken));
}

function getToken() {
  const tokenString = sessionStorage.getItem('token');
  return tokenString
}

function setUser(user) {
  sessionStorage.setItem('username', JSON.stringify(user))
}

function App() {
  const token = getToken();
  if(!token) {
    return (
      <BrowserRouter>
      <Switch>
        <Route exact path = "/"><Login setToken={setToken} setUser={setUser}/></Route>
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
