class OrdersController < ApplicationController
  before_filter :get_open_order
  before_filter :signed_in_user

  def index

  @placed_items= current_user.placed_items

  end

  def add_item
    @product = Product.find(params[:id])
    if @product
      @open_order.order_items.create(:product_id => @product.id, :quantity => 1, :price => @product.price)
      @open_order.recalculate
    end
  end

  def remove_item
    @product = Product.find(params[:id])
    @open_order.order_items.find_by_product_id(@product).destroy
    @sub = @open_order.recalculate
  end

  def confirm
    @shipping_address = @open_order.build_shipping_address
  end


  def submit
    @shipping_address = @open_order.create_shipping_address(params[:shipping_address])
    @open_order.update_attribute(:status, Order::PROCESSED)
    flash[:notice] = "Your order has been placed!!"
    redirect_to orders_path
  end


  protected

  def get_open_order
    @open_order = current_user.get_or_create_open_order
  end
end
