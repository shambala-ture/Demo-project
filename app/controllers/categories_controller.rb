class CategoriesController < ApplicationController

  def show
    @category = Category.all
    @category = Category.find(params[:id])
    @products = @category.products.paginate(:page => params[:page], :per_page => 3)
  end

end
