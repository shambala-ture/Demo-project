class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing_address, :class_name=>'Address'
  belongs_to :shipping_address, :class_name=>'Address'
  belongs_to :coupon
  has_many :used_coupons, dependent: :destroy
  has_many :order_details, dependent: :destroy
  def total_price(coupon,total)
    percent = coupon.discount_of / 100
    intermediate_total = total * percent 
    final_total = total - intermediate_total
  end
end
