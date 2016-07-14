class CartsController < ApplicationController
  before_filter :authenticate_user!, :only => [:checkout]

  def show
    
  end

  def new
    flash[:notice] = "Product was successfully added."
    session[:product_id] << params["product_id"]
    # redirect_to root_path
  end

  def update_product_quantity

    if params[:product_action] == "added"
      session[:product_id] << params["product_id"]
    else
      @session = session[:product_id]
      session[:product_id].delete_at(@session.index(params["product_id"]))
    end

      set_cart_quantity_price
      @product = Product.find(params[:product_id])
      if @cart_products[@product]
        @total_price = @cart_products[@product][:total_price].to_i
      end
      flash[:notice] = "Product was successfully #{params[:product_action]}."
      @count = session[:product_id].count(params[:product_id])
    
  end

  # def increment_product_quantity
  #   @count = session[:product_id].count(params[:product_id])
  #   flash[:notice] = "Product was successfully added."
  #   # redirect_to user_carts_path
  # end

  # def decrement_product_quantity
  #   @session = session[:product_id]
  #   session[:product_id].delete_at(@session.index(params["product_id"]))
  #   flash[:notice] = "Product was removed successfully."
  #   redirect_to user_carts_path
  # end

  def checkout
    
  end
 
  def remove_product 
    session[:product_id].delete(params[:product_id])
    flash[:notice] = "Product was removed successfully."
    redirect_to user_carts_path
  end
 
  def apply_coupon
    if Coupon.exists?(:code => params[:coupon])
      valid = true
      @coupon = Coupon.find_by(:code => params[:coupon])
      @message = "#{@coupon.code} applied"
      @percent = @coupon.discount_of / 100
      @intermediate_total = @total * @percent
      @final_total = @total - @intermediate_total
      @discount_amount = @total - @final_total 
      session[:coupon] = @coupon
    else
      valid = false
      @message = "Code Invalid"
    end
  end

  def remove_coupon
    session[:coupon] = ""
    flash[:notice] = "Coupon was removed successfully."
    redirect_to user_carts_checkout_path
    
  end

end