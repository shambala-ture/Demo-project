class ChangeContactUsTypeInContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :contact_us, :string
  end
end
