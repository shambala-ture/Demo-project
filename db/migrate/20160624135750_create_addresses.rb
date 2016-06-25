class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :country
      t.string :state
      t.integer :zipcode
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
