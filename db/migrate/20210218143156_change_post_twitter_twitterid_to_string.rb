class ChangePostTwitterTwitteridToString < ActiveRecord::Migration[6.1]
  def change
    change_column :post_twitters, :twitter_id, :string
  end
end
