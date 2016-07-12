class UserwishlistsController < ApplicationController
    before_filter :authenticate_user!
  def index
    @userwishlists = current_user.user_wish_lists
  end
  
  def show
    
  end

  def new
    @product = Product.find(params[:product_id])
    UserWishList.find_or_create_by(:user => current_user, :product => @product)
    redirect_to root_path
  end


  def destroy
    @userwishlist = UserWishList.find(params[:id])
    @userwishlist.delete
    redirect_to userwishlists_path
  end
end