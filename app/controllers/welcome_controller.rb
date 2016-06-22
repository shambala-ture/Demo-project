class WelcomeController < ApplicationController
  
  def index
  session[:product_id] ||= []
  @products = Product.all 
  end

  def login

    
  end
end
