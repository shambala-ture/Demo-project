class ChangeColumnContactUs < ActiveRecord::Migration
  def change
    rename_column :contacts, :contact_us, :contact_no
  end
end
