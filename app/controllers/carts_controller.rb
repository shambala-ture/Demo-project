class CartsController < ApplicationController
  before_filter :authenticate_user!, :only => [:checkout]

  def show
    
  end

  def new
    session[:product_id] << params["product_id"]
    flash[:notice] = "Product was successfully created."
    redirect_to root_path
  end

  def increment_product_quantity
    session[:product_id] << params["product_id"]
    flash[:notice] = "Product was successfully created."
    redirect_to user_carts_path
  end

  def decrement_product_quantity
    @session = session[:product_id]
    session[:product_id].delete_at(@session.index(params["product_id"]))
    flash[:notice] = "Product was removed successfully."
    redirect_to user_carts_path
  end

  def checkout
     
  end
 def remove_product 
  session[:product_id].delete(params[:product_id])
  flash[:notice] = "Product was removed successfully."
  redirect_to user_carts_path
 end

end