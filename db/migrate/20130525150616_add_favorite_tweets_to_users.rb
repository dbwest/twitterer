class AddFavoriteTweetsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_tweets, :integer
  end
end
