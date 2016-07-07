class UsedCoupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  belongs_to :order
end