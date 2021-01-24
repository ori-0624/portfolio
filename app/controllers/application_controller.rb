class ApplicationController < ActionController::Base
  #CSRF保護を無効にする。
  #React試行時の臨時対応
  protect_from_forgery with: :null_session
 

end
