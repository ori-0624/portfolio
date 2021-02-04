class HomeController < ApplicationController
  def home
    if signed_in? then
      @user = current_user
      @posts = Post.all
    else
    end
  end
end
