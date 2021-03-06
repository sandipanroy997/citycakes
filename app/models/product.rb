class Product < ActiveRecord::Base
  belongs_to:company
  has_many :order_items
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>", :large => "400x400" }

end

