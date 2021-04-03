class HomeController < ApplicationController
  def home
    if signed_in? then
      @posts = Post.all.page(params[:page])
      
      post_twitters = PostTwitter.where(provider: "AppleMusic")
      @post_twitter_current = post_twitters[0]
      @post_twitter_previouses = post_twitters.drop(1)
      @post_AppleMusic_url = @post_twitter_current.twitter_expanded_url.gsub("https://","https://embed.")
      @post_AppleMusic_id = Rack::Utils.parse_nested_query(URI.parse(@post_AppleMusic_url).query)["i"]
      
      render json: {
        'user': @user, 
        'post_Twitter': @post_twitter_current,
        'post_twitter_previouses': @post_twitter_previouses,
        'post_AppleMusic_url': @post_AppleMusic_url,
        'post_AppleMusic_id': @post_AppleMusic_id
      }
    else
      render json: {}
    end
  end
end
