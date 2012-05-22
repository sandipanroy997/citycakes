class ChangeColumnQuantity < ActiveRecord::Migration
  def up
   change_column:order_items, :quantity
  end

  def down
  end
end
