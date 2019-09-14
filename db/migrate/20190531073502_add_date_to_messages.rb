class AddDateToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :date, :datetime
  end
end
