class UsedCoupon < ActiveRecord::Base
  #validates :user_order_id, :user_id, :coupon_id, :presence => true
  belongs_to :user
  belongs_to :coupon
  #belongs_to :order
end