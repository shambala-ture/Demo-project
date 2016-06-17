class CreateProductAttributeAssociations < ActiveRecord::Migration
  def change
    create_table :product_attribute_associations do |t|
      t.boolean :status

      t.timestamps null: false
    end
  end
end
