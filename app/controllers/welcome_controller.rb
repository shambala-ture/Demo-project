class WelcomeController < ApplicationController
  
  def index
  session[:product_id] ||= []
  # @products = Product.all 
  @products = Product.paginate(:page => params[:page], :per_page => 3)
  @banners = Banner.all

  end
 
  def login

    
  end

  def faq
    
  end

  def online
    
  end

end
