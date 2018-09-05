class AddRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :ratings, :integer, array: true, default: []
    add_column :posts, :avg_rating, :integer
  end
end
