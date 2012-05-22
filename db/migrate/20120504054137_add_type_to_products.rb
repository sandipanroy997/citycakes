class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cake_type, :integer
  end
end
