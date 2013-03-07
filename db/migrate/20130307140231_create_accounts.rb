class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string  :provider
      t.string  :uid
      t.string  :name
      t.string  :oauth_token
      t.string  :oauth_token_secret
      t.boolean :main

      t.timestamps
    end
  end
end
