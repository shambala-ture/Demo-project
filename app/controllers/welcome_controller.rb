class WelcomeController < ApplicationController

  def index
  @products = Product.all 
  @categories = Category.where(parent_id: nil)
  end
end
