class AddOrderIdToUsedCoupon < ActiveRecord::Migration
  def change
    add_reference :used_coupons, :order, index: true, foreign_key: true
  end
end
