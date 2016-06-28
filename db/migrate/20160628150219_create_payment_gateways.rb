class CreatePaymentGateways < ActiveRecord::Migration
  def change
    create_table :payment_gateways do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
