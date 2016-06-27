class UserOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing_address, :class_name=>'Address'
  belongs_to :shipping_address, :class_name=>'Address'
  belongs_to :coupon
  has_many :used_coupon, :dependent => :destroy
end
