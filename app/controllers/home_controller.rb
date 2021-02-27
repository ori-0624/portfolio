class HomeController < ApplicationController
  def home
    if signed_in? then
      @posts = Post.all.page(params[:page])
      @post_AppleMusic = PostTwitter.find_by(provider: "AppleMusic")
      @post_AppleMusic_url = @post_AppleMusic.twitter_expanded_url.gsub("https://","https://embed.")
      @post_AppleMusic_id = Rack::Utils.parse_nested_query(URI.parse(@post_AppleMusic_url).query)["i"]
      #byebug
      #@post_Spotify = PostTwitter.find_by(provider: "Spotify")
    end
  end
end
