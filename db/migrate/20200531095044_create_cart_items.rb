class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true
      t.references :member, foreign_key: true
      t.integer :number, default: 1
      t.timestamps
    end
  end
end
