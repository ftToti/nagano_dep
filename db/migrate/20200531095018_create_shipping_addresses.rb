class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
    	t.references :member,					null: false, default: "", foreign_key: true
    	t.string :postcode,						null: false, default: ""
    	t.string :address,						null: false, default: ""
    	t.string :addressee,					null: false, default: ""
      t.timestamps
    end
  end
end
