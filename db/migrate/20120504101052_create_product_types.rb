class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
    ["Regular Cakes", "Wedding Cakes"," Special Cakes","Children Cakes","Numbered Cakes"].each_with_index do |cake, index|
      ProductType.create(:name => cake , :position => index + 1)
    end

  end
end
