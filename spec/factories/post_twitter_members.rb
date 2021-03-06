FactoryBot.define do
  factory :post_twitter do
      #自分のアカウント、自分のツイートとする
      twitter_id {"1362009036661514245"}
      twitter_expanded_url {"https://music.apple.com/jp/album/oblivion/308924866?i=308924922"}
      provider {"AppleMusic"}
  end
end