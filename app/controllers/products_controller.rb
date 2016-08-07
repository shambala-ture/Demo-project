class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Successfully created review."
      redirect_to product_path(@product)
    else
      render :action => 'show'
    end
  end

  def add_to_cart
    session[:product_id] << params["id"]
    set_cart_quantity_price
      @product = Product.find(params[:id])
      flash[:notice] = "Product was successfully added."
      render 'show'
  end

 private
  def review_params
    params.require(:review).permit(:name, :email, :message, :rating, :product_id)
  end
end
