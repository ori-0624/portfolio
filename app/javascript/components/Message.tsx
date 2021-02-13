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
    let error_list;
    
    if (this.props.noticeMessage) {
      notice_dom = (<div className="alert alert-info">{this.props.noticeMessage}</div>);
    }
    if (this.props.alertMessage) {
      alert_dom = (<div className="alert alert-danger">{this.props.alertMessage}</div>);
    }
    if (this.props.errorMessages) {
      error_list = this.props.errorMessages.map(message => (<li key="message">{ message }</li>))
      error_dom = (<div className="alert alert-danger">{error_list}</div>)
      //error_dom += this.props.errorMessages.map(message => (<li key="message" className="alert alert-danger">{ message }</li>))
      //error_dom += (</div>)
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
