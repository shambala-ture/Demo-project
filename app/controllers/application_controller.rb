class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_parent_categories
  def set_parent_categories
    @categories = Category.where(parent_id: nil)
  end
end
