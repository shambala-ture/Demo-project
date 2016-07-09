class CreateUserWishLists < ActiveRecord::Migration
  def change
    create_table :user_wish_lists do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
