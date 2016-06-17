class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
