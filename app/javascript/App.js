import * as React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Session from './components/session'

class App extends React.Component {
  render = () => {
    return(
      <div className="App">
        <Router>
          <div>
            <Route exact path='/' component={Session}/>
          </div>
        </Router>
      </div>
      )
  }
}

export default App;