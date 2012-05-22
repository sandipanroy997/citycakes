class AddForeignKeyToAddress < ActiveRecord::Migration
  def change
    add_foreign_key(:addresses, :companies)
  end
end
