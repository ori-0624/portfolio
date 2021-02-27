import * as React from "react"
import Iframe from 'react-iframe'


type Props = {
  content_url: string
  content_id: string
}

type state = {
  isLoaded: boolean
  musicKit: any
  song: any
  artworkUrl: string
}


class Music extends React.Component<Props> {
  
  constructor(props) {
    super(props);
    this.state = {
      isLoaded: false,
      musicKit: undefined
    }
    
  }
  
  // 初回レンダリング後に発火するイベント
  // API経由のイベントはここで拾う
  componentDidMount = () => {
    document.addEventListener('musickitloaded', () => {
      console.log("COMPONENT DID MOUNT!!! ^O^")
      // MusicKit global is now defined
      window.MusicKit.configure({
          developerToken: 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjRHSjI4OFRDS1MifQ.eyJpc3MiOiI5V0M2NTJXVlk4IiwiaWF0IjoxNjE0MTY3Mzc5LCJleHAiOjE2Mjk3MTkzNzl9.a-nnLi2uT_pCz7_KTxpHRVPeOAHETARm5w9If7dqNjigITdy86ThU7n0txTcWXb-PWxDerfwp8jp_1pryGLdDg',
          app: {
              name: 'MyApp',
              build: '1'
          }
      });
      let musicKit = window.MusicKit.getInstance()
      this.setState({ musicKit: musicKit })
      
      let id = this.props.content_id
      
      //自動で認証・再生する
      musicKit.authorize()
      .then(() => {
        musicKit.setQueue({song: id})
        .then(() => {
            //this.play();
            
            
            musicKit.api.song(id)
            .then((song)=>{
              this.setState({
                song: song,
                artworkUrl: MusicKit.formatArtworkURL(song.attributes.artwork, 300, 300)
              })
              this.setState({isLoaded: true})

            })
        });
      });
    });

  }

  authorize = () => {

          

  }
  
  play =  () => {
    window.MusicKit.getInstance().play()
  }
  
  stop = () => {
    window.MusicKit.getInstance().stop()
  }
  

  render = () => {
    var isLoaded = this.state.isLoaded;
    if (!isLoaded) {
      return (
        <div>
          <button onClick={this.play}>Play</button>
          <p>Now Loading</p>
        </div>
                  )
    } else {
      return (
        <div>
          <button onClick={this.authorize}>authorize</button>
          <button onClick={this.play}>Play</button>
          <button onClick={this.stop}>Stop</button>

          <p><img src={this.state.artworkUrl} width="300" height="300" /></p>
          
        </div>
      );
    }
  }
}

export default Music
