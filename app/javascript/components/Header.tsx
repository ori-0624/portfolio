import * as React from "react"

// 当コンポーネントは未使用。現在、ヘッダ部は現在Reactをやめ、Railsで書いている

type Props = {
  signed_in: boolean;
}

const deleteSession = () => {
  fetch('/sign_out', {
    method: 'delete'
  });
}

class Header extends React.Component<Props> {
  
  constructor(props: Props) {
    super(props);
  }

  render () {
    let header_btn_tags;
    if (this.props.signed_in) {
      header_btn_tags = (
        <form method="delete" name="sign_out" action="/sign_out">
          <li><a href="/" onClick={deleteSession}>Sign Out</a></li>
        </form>);
    } else {
      header_btn_tags = (
        <div>
          <li><a href="/sign_in">Sign In</a></li>
          <li><a href="/sign_up">Sign Up</a></li>
        </div>
        );
    }
    
    
  
    return (
      //<React.Fragment>
      //</React.Fragment>
      <header>
        <div className="logo">
          <h1>MyApp</h1>
        </div>
        <div className="header-btn">
          {header_btn_tags}
        </div>
      </header>
    );
  }
}

export default Header
