import * as React from "react"
import Iframe from 'react-iframe'
import {TwitterTweetEmbed} from 'react-twitter-embed'

type Props = {
  tweet_id: any
}

class Tweet extends React.Component<Props> {
  
  constructor(props) {
    super(props);
    console.log(props)
  }
  
  render = () => {
    //todo if devise mapping.rememberable?は無視した
      return (
        <div>
          <h2>ログイン</h2>
          
            <div className="field">
              <p>email</p>
              <input type="text"name="Email" value="email" />
            </div>
          
            <div className="field">
              <p>password</p>
              <input type="text" name="Password" value="Password" />
            </div>
          
          
            <div className="actions">
              <input type="submit" />
            </div>
            
        </div>

      )
  }
}

export default Tweet
