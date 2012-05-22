class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id  , :null => false
      t.string :status
      t.decimal :subtotal , :null => false, :default => 0

      t.timestamps
    end
      add_foreign_key(:orders, :users)
  end
end
