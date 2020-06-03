class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.references :product_genre, foreign_key: true
    	t.string  :name, index: true
    	t.text    :description
    	t.string  :image_id
    	t.integer :unit_price
    	t.boolean :is_sales, default: true

    	t.timestamps
    end
  end
end
