class HomeController < ApplicationController
  def home
    if signed_in? then
      @user = current_user
      @posts = Post.all.page(params[:page])
    end
  end
end
