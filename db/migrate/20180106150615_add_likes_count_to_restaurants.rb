class AddLikesCountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :likes_count, :integer, default: 0
  end
end
