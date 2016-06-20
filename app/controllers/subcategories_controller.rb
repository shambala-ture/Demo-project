class SubcategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

end
