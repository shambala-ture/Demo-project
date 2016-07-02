class Product < ActiveRecord::Base
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images
  has_many :user_order
end
