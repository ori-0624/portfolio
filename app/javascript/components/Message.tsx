import * as React from "react"

type Props = {
  noticeMessage: string;
  alertMessage: string;
  errorMessages: string[];
}

class Message extends React.Component<Props> {

  render () {
    let notice_dom;
    let alert_dom;
    let error_dom;
    
    if (this.props.noticeMessage) {
      notice_dom = (<p className="notice">{this.props.noticeMessage}</p>);
    }
    if (this.props.alertMessage) {
      alert_dom = (<p className="alert">{this.props.alertMessage}</p>);
    }
    if (this.props.errorMessages) {
      error_dom = this.props.errorMessages.map(message => (<li className="error">{ message }</li>))
    }
    
    return (
      <div className="message">
        {notice_dom}
        {alert_dom}
        {error_dom}
      </div>
    );
  }
}

export default Message
