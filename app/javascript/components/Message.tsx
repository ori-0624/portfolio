import * as React from "react"
//import PropTypes from "prop-types"
//import Link from "react-router-dom"

type Props = {
  notice: any;
  alertMessage: any;
}

class Message extends React.Component<Props> {

  render () {
    let notice_dom;
    let alert_dom;
    
    if (this.props.notice) {
      notice_dom = (<p className="notice">{this.props.notice}</p>);
    }
    if (this.props.alertMessage) {
      alert_dom = (<p className="alert">{this.props.alertMessage}</p>);
    }
    
    return (
      //<React.Fragment>
      //</React.Fragment>
      <div className="message">
        {notice_dom}
        {alert_dom}
      </div>
    );
  }
}

export default Message
