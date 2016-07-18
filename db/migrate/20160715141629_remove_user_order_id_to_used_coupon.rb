class RemoveUserOrderIdToUsedCoupon < ActiveRecord::Migration
  def change
    remove_column :used_coupons, :user_order_id, :integer
  end
end
