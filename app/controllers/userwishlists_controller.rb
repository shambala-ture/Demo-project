class UserwishlistsController < ApplicationController

  def index
    # set_cart_quantity_price
   @products = Product.find(params[:product_id])

  end

 

end