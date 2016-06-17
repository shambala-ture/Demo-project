class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.string :name
      t.decimal :price
      t.boolean :status
      t.timestamps null: false
    end
  end
end
