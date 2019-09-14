class AddPhotoToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :photo, :string, default: 'surf.jpg'
  end
end
