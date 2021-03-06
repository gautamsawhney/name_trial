class CreateAuthtokens < ActiveRecord::Migration[5.0]
  def change
    create_table :authtokens do |t|
      t.string :token
      t.datetime :last_used_at
      t.inet :sign_in_ip
      t.string :user_agent
      t.string :device_id
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
