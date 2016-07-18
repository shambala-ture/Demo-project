class RemoveTableOrders < ActiveRecord::Migration
  def change
    remove_column :user_orders, :order_id
    drop_table :orders, force: :cascade
  end
end
