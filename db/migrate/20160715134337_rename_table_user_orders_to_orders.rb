class RenameTableUserOrdersToOrders < ActiveRecord::Migration
  def change
    rename_table :user_orders, :orders
  end
end
