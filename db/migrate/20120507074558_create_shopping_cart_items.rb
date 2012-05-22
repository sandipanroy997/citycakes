class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.integer :user_id , :null => false
      t.integer :product_id, :null => false
      t.integer :quantity

      t.timestamps
    end


          add_foreign_key(:shopping_cart_items, :products)
  end
end
