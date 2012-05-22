class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id , :null => false
      t.integer :product_id, :null => false
      t.decimal :price, :null => false , :default => 0

      t.timestamps
    end
       add_foreign_key(:order_items, :orders)
       add_foreign_key(:order_items, :products)
  end
end
