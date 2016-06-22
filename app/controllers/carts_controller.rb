class CartsController < ApplicationController
  def show
    @products=Product.find(session[:product_id])
  end

  def new
    session[:product_id] << params["product_id"]
    redirect_to root_path
  end
end
