class SubcategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(:page => params[:page], :per_page => 3)
  end

end
