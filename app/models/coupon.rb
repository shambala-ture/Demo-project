class Coupon < ActiveRecord::Base
  validates :code, :discount_of, :no_of_uses, :presence => true
  has_many :order, :dependent => :destroy
  has_many :used_coupon, :dependent => :destroy
end
