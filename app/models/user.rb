class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  has_many :microposts,  dependent: :destroy
  has_many :shopping_cart_items
  has_many :orders
  has_one :open_order, :class_name => "Order", :conditions => "orders.status = 0"



  validates :name, presence: true
 # user.errors.full_messages
  #=> ["Name can't be blank"]
  validates :email, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  before_save :create_remember_token

  def has_product?(product)
    return false unless self.open_order
    items = self.open_order.order_items.collect(&:product_id) #this takes all the order items into the variable items
    items.include?(product.id)               #this checks whether the product_id of the product sent as
                                             #parameter matches with the product id of the objects present in items.
  end

  def placed_items
    self.orders.where("status = ?", Order::PROCESSED).collect{ |order| order.order_items.collect(&:product)}.flatten
  end

  def find_order_item(item)
    self.open_order.order_items.find_by_product_id(item)
  end


   # def feed
      #puts current_user
        # This is preliminary. See "Following users" for the full implementation.
        #Micropost.where("user_id = ?", id) if current_user
   # end





  def get_or_create_open_order
    self.open_order || self.orders.create(:status => Order::OPEN, :subtotal => 0)
  end

  private

  def create_remember_token
    if new_record?
      self.remember_token = SecureRandom.urlsafe_base64
    end
  end
end
