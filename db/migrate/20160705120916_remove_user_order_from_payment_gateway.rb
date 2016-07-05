class RemoveUserOrderFromPaymentGateway < ActiveRecord::Migration
  def change
    remove_column :payment_gateways, :user_order_id
    add_column :payment_gateways, :order_id, :integer
  end
end
