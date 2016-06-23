class WelcomeController < ApplicationController
  
  def index
  session[:product_id] ||= []
  # @products = Product.all 
  @products = Product.paginate(:page => params[:page], :per_page => 3)
  # @categories = Category.paginate(:page => params[:page], :per_page => 2)
  end

  def login

    
  end
end
