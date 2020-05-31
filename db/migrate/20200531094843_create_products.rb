class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.integer :product_genre_id
    	t.string  :name, index: true
    	t.text    :description
    	t.string  :image_id
    	t.integer :unit_price
    	t.boolean :is_sales, default: true

    	t.timestamps
    end
  end
end
