class AddForeignKeyToProduct < ActiveRecord::Migration
  def change
    add_foreign_key(:products, :companies)
  end
end
