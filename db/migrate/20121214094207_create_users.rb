class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :thumbnail_small_url
      t.string :thumbnail_medium_url
      t.string :gender
      t.string :uuid

      t.string :encrypted_password, :limit => 128, :null => false
      t.string :password_salt, :null => false

      t.string :confirmation_token
      t.string :confirmed_at
      t.string :confirmation_token
      t.datetime :confirmation_sent_at

      t.string :remember_token
      t.datetime :remember_created_at

      t.string :reset_password_token

      t.string :time_zone
      t.timestamps
    end
  end
end