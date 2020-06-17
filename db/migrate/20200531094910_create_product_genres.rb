class CreateProductGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :product_genres do |t|

    	t.string  :category, null: false
    	t.boolean :is_enabled, default: true

      t.timestamps
    end
  end
end
