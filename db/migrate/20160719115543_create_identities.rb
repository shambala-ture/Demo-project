class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :provider
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
