import * as React from "react"
import Iframe from 'react-iframe'
import ReactPlayer from 'react-player'

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
            
            musicKit.api.song(id)
            .then((song)=>{
              console.log(song)
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
  
  play =  () => {
    this.state.musicKit.play()
    console.log(this.state)
    this.state.playbackRate = this.state.musicKit.player.currentPlayBackTime / this.state.musicKit.player.currentPlayBackDuration * 100
    this.intervalId = setInterval(() => {
      //console.log(this.calcPlaybackRate())
      this.forceUpdate();
    }, 1000)
  }
  
  pause = () => {
    this.state.musicKit.pause()
    clearInterval(this.intervalId)
  }
  
  stop = () => {
    this.state.musicKit.stop()
    clearInterval(this.intervalId)
  }
  
  changePos = (event) => {
    let offsetLeft = event.target.offsetLeft
    // クリック地点座標のWidth比を再生率とする(カーソルの絶対座標-オブジェクトの余白)/オブジェクトの幅)
    let clickRate = (event.clientX - event.target.offsetLeft) / event.target.clientWidth

    this.state.musicKit.seekToTime(this.state.song.attributes.durationInMillis/1000 * clickRate)

  }
  

  render = () => {
    let isLoaded = this.state.isLoaded;
    if (!isLoaded) {
      return (
        <div>
          <button onClick={this.play}>Play</button>
          <p>Now Loading</p>
        </div>
                  )
    } else {
      //ReactPlayerでCORSが発生。URLがembedでもだめ おそらくサービス自体非対応なので、プレイヤーは自前で実装する？
      return (
        <div className="music">

          <p><img src={this.state.artworkUrl} width="300" height="300" /></p>
          
          <div className="playback_bar_back" onClick={() => this.changePos(event)} >
            <div className="playback_bar" style={{width: + this.state.musicKit.player.currentPlaybackProgress * 100 + "%"}}></div>
          </div>
          <div className="playback_buttons">
            <img className="playback_button" src="icon/play.png" onClick={this.play} />
            <img className="playback_button" src="icon/pause.png" onClick={this.pause} />
            <img className="playback_button" src="icon/stop.png" onClick={this.stop} />
          </div>
          
        </div>
      );
    }
  }
}

export default Music
