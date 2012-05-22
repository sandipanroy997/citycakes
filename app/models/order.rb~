class Order < ActiveRecord::Base

  has_many:order_items
  has_one:shipping_address

  OPEN = 0
  PLACED = 1
  PROCESSED = 2
  CANCELED = 3

  def recalculate
    total = 0
    self.order_items.each do |item|
      total += item.quantity * item.price
    end
    self.subtotal = total
    self.save!
  end
end
