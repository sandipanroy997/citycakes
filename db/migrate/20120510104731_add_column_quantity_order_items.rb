class AddColumnQuantityOrderItems < ActiveRecord::Migration
  def up
    change_column :order_items, :quantity, :integer, :null => false , :default => 1
  end

  def down
  end
end
