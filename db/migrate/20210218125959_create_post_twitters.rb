class CreatePostTwitters < ActiveRecord::Migration[6.1]
  def change
    create_table :post_twitters do |t|
      t.numeric :twitter_id, null: false
      t.string :twitter_text
      t.string :twitter_expanded_url
      t.numeric :twitter_user_id
      t.timestamp :twitter_created_at
      t.string :provider

      t.timestamps
    end
    
    add_index :post_twitters, :twitter_id
  end
end
