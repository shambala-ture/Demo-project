class ProductCategory < ActiveRecord::Base
  validates :category_id, :product_id, :presence => true
  belongs_to :product
  belongs_to :category
end
