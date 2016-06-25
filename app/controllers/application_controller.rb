class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  
  before_filter :set_parent_categories
  def set_parent_categories
    @categories = Category.where(parent_id: nil)
  end
  
  before_filter :set_cart_quantity_price, :only => [:show, :checkout]
  def set_cart_quantity_price
    @quantities = {}
    @uniq_prods = session[:product_id].uniq
    @uniq_prods.each do |i| 
      @quantities[i] =  session[:product_id].count(i) 
    end
    @cart_products = {}
    @quantities.each do |k,v|
      product=Product.find(k)
      @cart_products[product]={"quantity": v,"total_price": v * product.price}
    end
    @total=0
  end
  
end
