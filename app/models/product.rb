class Product < ActiveRecord::Base
  validates :description, :name, :price, :quantity, :presence =>true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :user_wish_lists
  has_many :reviews
end
