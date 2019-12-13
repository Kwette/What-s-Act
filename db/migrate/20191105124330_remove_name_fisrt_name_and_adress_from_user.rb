class RemoveNameFisrtNameAndAdressFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :address, :string
    remove_column :users, :phone, :string
  end
end
