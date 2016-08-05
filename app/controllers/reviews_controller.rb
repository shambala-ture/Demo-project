class ReviewsController < ApplicationController
  
  def create
    # @product = Product.find(params[:product_id])
    @review = @product.reviews.build(params[:review])
    if @review.save
      flash[:notice] = "Successfully created review."
      # redirect_to product_reviews_path(@product)
    else
      render :action => 'new'
    end
  end
end