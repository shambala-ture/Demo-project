class Order < ActiveRecord::Base
  has_many :user_order
  has_many :used_coupon
end
