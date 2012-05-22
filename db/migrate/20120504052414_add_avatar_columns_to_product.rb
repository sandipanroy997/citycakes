class AddAvatarColumnsToProduct < ActiveRecord::Migration
  def change

      change_table :products do |t|
      t.has_attached_file :avatar
    end

  end
end
