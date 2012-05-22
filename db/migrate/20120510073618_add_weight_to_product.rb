class AddWeightToProduct < ActiveRecord::Migration
  def change
    add_column :products, :weight, :string
  end
end
