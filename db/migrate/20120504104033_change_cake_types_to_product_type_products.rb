class ChangeCakeTypesToProductTypeProducts < ActiveRecord::Migration
  def up
    rename_column :products, :cake_type, :product_type
  end

  def down

  end
end
