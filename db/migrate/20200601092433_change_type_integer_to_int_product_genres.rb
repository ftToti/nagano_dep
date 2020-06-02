class ChangeTypeIntegerToIntProductGenres < ActiveRecord::Migration[5.2]
  def up
  	change_column :product_genres, :category, :string
  end
  def down
  	change_column :product_genres, :category, :integer
  end
end
