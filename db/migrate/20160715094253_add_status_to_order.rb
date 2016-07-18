class AddStatusToOrder < ActiveRecord::Migration
  def change
    change_column :user_orders, :status, :string,  :default => "pending"
  end
end
