class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
