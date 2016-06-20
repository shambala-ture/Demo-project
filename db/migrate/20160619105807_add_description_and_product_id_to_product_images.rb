class AddDescriptionAndProductIdToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :description, :string
    add_reference :product_images, :product, index: true
  end
end