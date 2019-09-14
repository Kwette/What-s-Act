class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook, :string
    add_column :users, :uidfacebook, :string
  end
end
