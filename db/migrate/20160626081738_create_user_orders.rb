class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|
      t.decimal :shipping_charges, precision: 12, scale: 2
      t.integer :payment_gateway_id
      t.string :status
      t.decimal :total_amount, precision: 12, scale: 2
      t.references :user
      t.references :coupon
      t.integer :shipping_method
      t.string :transaction_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.timestamps null: false
    end
  end
end
