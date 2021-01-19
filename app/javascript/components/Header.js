import React from "react"
import PropTypes from "prop-types"
//import Link from "react-router-dom"

class Header extends React.Component {
  render () {
    return (
      //<React.Fragment>
      //</React.Fragment>
      <header>
        <div class="logo">
          <h1>MyApp</h1>
        </div>
        <div class="header-btn">
          <li><a href="/sign_in">Sign in</a></li>
          <li><a href="/sign_up">Sign up</a></li>
        </div>
      </header>
    );
  }
}

export default Header
