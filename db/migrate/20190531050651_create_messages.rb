class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :like, default: 0
      t.references :sender, foreign_key: { to_table: :users}
      t.references :receiver, foreign_key: { to_table: :users}
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
