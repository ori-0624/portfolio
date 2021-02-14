class UserController < Devise::OmniauthCallbacksController
    
  def index
    @user = current_user
    @posts = Post.all
  end
    
end
