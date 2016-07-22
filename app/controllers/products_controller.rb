class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    # flash[:notice] = "Product was successfully added."
  end
end
