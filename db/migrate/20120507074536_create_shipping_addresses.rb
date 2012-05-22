class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.integer :order_id , :null => false
      t.timestamps
    end
       add_foreign_key(:shipping_addresses, :orders)
  end
end
