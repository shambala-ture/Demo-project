class Coupon < ActiveRecord::Base
  has_many :user_order, :dependent => :destroy
end
