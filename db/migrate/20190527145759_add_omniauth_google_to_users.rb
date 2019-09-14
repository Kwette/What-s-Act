class AddOmniauthGoogleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :google, :string
    add_column :users, :uidgoogle, :string
  end
end
