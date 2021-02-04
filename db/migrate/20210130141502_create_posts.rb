class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      # postは今のところ更新しない予定
      #t.timestamps
      
      t.references :user, null: false, index: false, foreign_key: true
      t.string :content, null: false
      t.datetime :created_at, null:false
      
    end
    
    add_index :posts, [:user_id, :created_at]
  end
end
