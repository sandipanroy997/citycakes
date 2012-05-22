class HomeController < ApplicationController
  def index
    @products = Product.limit(9).all.group_by(&:product_type)
  end

  def help
  end

  def show
  end
end
