class HomeController < ApplicationController
  def home
    if signed_in? then
      @posts = Post.all.page(params[:page])
      @post_twitter = PostTwitter.all.limit(1)[0]
    end
  end
end
