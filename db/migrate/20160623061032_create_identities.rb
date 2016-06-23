class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.references :account, foreign_key: true
      t.string :provider
      t.string :accesstoken
      t.string :refreshtoken
      t.string :uid

      t.timestamps
    end
  end
end
