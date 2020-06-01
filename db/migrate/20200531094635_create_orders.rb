class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|


    t.references :member, foreign_key: true
    t.integer :postage, null: false, default: 800
    t.integer :subtotal
    t.integer :payment_method, null: false, default: 1
    t.integer :order_status, null: false, default: 1
    t.string  :postcode
    t.string  :address
    t.string  :addressee
    t.timestamps
    end
  end
end
