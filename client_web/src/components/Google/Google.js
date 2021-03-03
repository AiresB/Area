import React, { Component } from 'react'
import { GoogleLogin, GoogleLogout } from 'react-google-login';

const dotenv = require('dotenv');
dotenv.config();
const CLIENT_ID = '926573912321-i5tvvg7pcqo89ejhfko6glt4hicp4kti.apps.googleusercontent.com';
const SCOPE = "https://www.googleapis.com/auth/gmail.readonly https://www.googleapis.com/auth/gmail.send https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/youtube"

class GoogleBtn extends Component {
   constructor(props) {
    super(props);

    this.state = {
      isLogined: false,
      accessToken: ''
    };
    this.login = this.login.bind(this);
    this.handleLoginFailure = this.handleLoginFailure.bind(this);
    this.logout = this.logout.bind(this);
    this.handleLogoutFailure = this.handleLogoutFailure.bind(this);
  }

  async registerUser(data) {
    return fetch('http://127.0.0.1:8080/user/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    .then(data => data.json())
    .then(data => { 
      return (data)
    })
      .catch((err) => {
        console.error(err);
      })
   }
   async loginUser(credentials) {
    if (credentials) {
      try {
        return fetch('http://127.0.0.1:8080/user/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(credentials)
        })
          .then(data => data.json())
          .then(data => { 
            return (data)
          })
          .catch((err) => {
            console.error(err);
          })
      } catch(e) {
        console.error(e)
      }
    }
  }
  async areaLogin(data) {
    var response = await this.loginUser({email: data.profileObj.email, google: data.tokenObj});
    
    console.log(response);
    if (response.error === true) {
      var responseRegister = await this.registerUser({email: data.profileObj.email, username: data.profileObj.name, google: data.tokenObj});
      console.log(responseRegister);
      sessionStorage.setItem('userId', responseRegister.user.id);
      sessionStorage.setItem('username', responseRegister.user.username);
    } 
    // if (response.error === false) {
    //   sessionStorage.setItem('userId', response.user.id);
    //   sessionStorage.setItem('username', response.user.username);
    // }
  }
  login (response) {
    if(response.accessToken){
      this.setState(state => ({
        isLogined: true,
        accessToken: response.accessToken
      }));
      this.areaLogin(response);
      this.props.history.push("/dashboard");
      this.props.history.go(0);
    }
  }

  logout (response) {
    this.setState(state => ({
      isLogined: false,
      accessToken: ''
    }));
  }

  handleLoginFailure (response) {
    alert('Failed to log in')
  }

  handleLogoutFailure (response) {
    alert('Failed to log out')
  }

  render() {
    return (
    <div>
      { this.state.isLogined ?
        <GoogleLogout
          clientId={ CLIENT_ID }
          buttonText='Logout'
          onLogoutSuccess={ this.logout }
          onFailure={ this.handleLogoutFailure }
        >
        </GoogleLogout>: <GoogleLogin
          clientId={ CLIENT_ID }
          buttonText={this.props.message}
          onSuccess={ this.login }
          onFailure={ this.handleLoginFailure }
          cookiePolicy={ 'single_host_origin' }
          responseType='code,token'
          scope={SCOPE}
        />
      }
    </div>
    )
  }
}

export default GoogleBtn;