class AddColumnToPostTwitterForDisplay < ActiveRecord::Migration[6.1]
  def change
    add_column :post_twitters, :twitter_lang, :string
    add_column :post_twitters, :twitter_hashtag, :string
    add_column :post_twitters, :twitter_url, :string
    add_column :post_twitters, :twitter_user_name, :string
    add_column :post_twitters, :twitter_user_screen_name, :string
  end
end
