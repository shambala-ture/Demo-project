class OrderDetail < ActiveRecord::Base
  validates :order_id, :product_id, :quantity, :presence =>true
  belongs_to :order
  belongs_to :product
end
