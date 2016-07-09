class Order < ActiveRecord::Base
  has_many :user_orders
  has_many :users, through: :user_orders
  has_many :used_coupon
  has_many :order_details

  def total_price(coupon,total)
    percent = coupon.discount_of / 100
    intermediate_total = total * percent 
    final_total = total - intermediate_total
  end
end
