class CreateCms < ActiveRecord::Migration
  def change
    create_table :cms do |t|
      t.string :key
      t.string :value

      t.timestamps null: false
    end
  end
end
