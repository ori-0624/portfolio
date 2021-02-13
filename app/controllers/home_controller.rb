class HomeController < ApplicationController
  def home
    if signed_in? then
      @posts = Post.all.page(params[:page])
    end
  end
end
