class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :company_id
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :street
      t.string :country

      t.timestamps
    end
    
  end
end
