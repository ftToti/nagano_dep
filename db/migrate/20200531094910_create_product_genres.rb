class CreateProductGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :product_genres do |t|

    	t.integer :category, null: false, default: 1
    	t.boolean :is_enabled, null: false, default: true

      t.timestamps
    end
  end
end
