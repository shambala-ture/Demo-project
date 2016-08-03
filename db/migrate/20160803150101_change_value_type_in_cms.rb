class ChangeValueTypeInCms < ActiveRecord::Migration
  def change
    change_column :cms, :value, :text
  end
end
