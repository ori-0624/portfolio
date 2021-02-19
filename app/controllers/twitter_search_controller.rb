require 'twitter'

class TwitterSearchController < ApplicationController
  
  # search twitter's posts
  # currently search only JAPANESE tweets with AppleMusic links
  def tweet_search
    # Twitter APIから投稿を取得する
    query = "music.apple.com/jp/album"
    options = {
      count: 1,
      exclude: "retweets"
    }
    result_tweets = twitterClient.search(query, options)

    # 取得結果をDBに保存する
    result_tweets.attrs[:statuses].each do |status|
      byebug
      # urlが存在しないツイートは切り捨てる
      if status[:entities][:urls].count == 0
        continue
      end
      
      # urlを複数持つツイートは切り捨てる
      if status[:entities][:urls].count > 1
        continue
      end
      
      PostTwitter.create(
        twitter_id: status[:id],
        twitter_text: status[:text],
        twitter_expanded_url: status[:entities][:urls][0][:expanded_url],
        twitter_user_id: status[:user][:id],
        twitter_created_at: status[:created_at],
        provider: "music.apple.com",
        twitter_lang: status[:lang],
        twitter_hashtag: status[:entities][:hashtag].inspect,
        twitter_url: status[:entities][:urls][0][:url],
        twitter_user_name: status[:user][:name],
        twitter_user_screen_name: status[:user][:screen_name]
      )
    end
    
    redirect_to root_path
    
  end
  
  private
  
  def twitterClient
    @twitterClient ||= Twitter::REST::Client.new(
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET_KEY'],
      access_token: ENV['TWITTER_ACCESS_TOKEN'],
      access_token_secret: ENV['TWITTER_ACCESS_SECRET_TOKEN']
    )
  end
  
end
