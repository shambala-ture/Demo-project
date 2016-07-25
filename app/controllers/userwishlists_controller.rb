class UserwishlistsController < ApplicationController
    before_filter :authenticate_user!
  def index
    @userwishlists = current_user.user_wish_lists
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    session[:product_id] << params["product_id"]
    set_cart_quantity_price
      @product = Product.find(params[:product_id])
      if @cart_products[@product]
        @total_price = @cart_products[@product][:total_price].to_i
      end
      flash[:notice] = "Product was successfully added."
      redirect_to userwishlists_path
  end
  
  def show
    
  end

  def new
    @product = Product.find(params[:product_id])
    UserWishList.find_or_create_by(:user => current_user, :product => @product)
    flash[:notice] = "Product was successfully added."
    redirect_to root_path
  end

  def destroy
    @userwishlist = UserWishList.find(params[:id])
    @userwishlist.delete
    flash[:notice] = "Product was successfully removed."
    redirect_to userwishlists_path
    
  end
end