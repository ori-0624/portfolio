class ApplicationController < ActionController::Base

    
 private 
 # devise: ログイン後の遷移パス
 # TODO 未テスト
 #def after_sign_in_path_for(resource)
#  if !(flash.notice.empty?)
#    redirect_to user_index_path
#  else
#    render 'registrations/new'
#  end
# end
 

end
