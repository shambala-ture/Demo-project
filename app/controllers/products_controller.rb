class ProductsController < ApplicationController
  def show
    
    @product = Product.find(params[:id])
    # flash[:notice] = "Product was successfully added."
  end
  def add_to_cart
    session[:product_id] << params["id"]
    set_cart_quantity_price
      @product = Product.find(params[:id])
      flash[:notice] = "Product was successfully added."
      render 'show'
  end
end
