class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|

    t.references :product, foreign_key: true
    t.references :order, foreign_key: true
    t.integer :purchase_price
    t.integer :number
   	t.integer :production_status, null: false, default: 1
    t.timestamps
    end
  end
end
