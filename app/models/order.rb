class Order < ActiveRecord::Base
  has_many :user_orders
  has_many :users, through: :user_orders
  has_many :used_coupon
  has_many :order_details
end
