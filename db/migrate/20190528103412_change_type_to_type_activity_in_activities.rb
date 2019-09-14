class ChangeTypeToTypeActivityInActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :type, :type_activity
  end
end
