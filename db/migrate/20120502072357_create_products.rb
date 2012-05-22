class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :company_id
      t.integer :price
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  
  end
end
