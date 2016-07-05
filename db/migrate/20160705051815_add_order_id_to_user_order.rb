class AddOrderIdToUserOrder < ActiveRecord::Migration
  def change
    add_reference :user_orders, :order, index: true, foreign_key: true
  end
end
