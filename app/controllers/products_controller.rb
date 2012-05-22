class ProductsController < ApplicationController

  def create
    @product = Product.create( params[:product])
    redirect_to product_path(@product)
  end

  def index
    @products = if params[:id]
                  Product.where("product_type = ?", params[:id])
                else
                  Product.all
                end

  end
  def edit
    @product = Product.find(params[:id])
  end

  def update
 @product = Product.find(params[:id])


     if @product.update_attributes(params[:product])
       flash[:success] = "Product updated"
        redirect_to product_path(@product)


     else
        render 'edit'

     end
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

 def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product Deleted"
    redirect_to product_path

  end
end
