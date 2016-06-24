class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :create_by_id
      t.decimal :discount_of, precision: 5, scale: 2
      t.integer :modified_by_id
      t.integer :no_of_uses
      t.boolean :status

      t.timestamps null: false
    end
  end
end
