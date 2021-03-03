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
      return (
      <div className="twitter_content">
        <TwitterTweetEmbed tweetId={this.props.tweet_id} placeholder="Now Loading" options={{align: 'center'}} />
      </div>
      )
  }
}

export default Tweet
