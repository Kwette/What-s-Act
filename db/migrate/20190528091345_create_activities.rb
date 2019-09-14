class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :type
      t.integer :price
      t.text :description
      t.integer :max_participants
      t.references :seller, foreign_key: { to_table: :users}
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
