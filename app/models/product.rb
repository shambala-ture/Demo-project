class Product < ActiveRecord::Base
  validates :description, :name, :price, :presence =>true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images
  has_many :orders
  has_many :user_wish_lists
end
