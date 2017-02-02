class AddIsHiddenToMission < ActiveRecord::Migration[5.0]
  def change
    add_column :missions, :is_hidden, :boolean, default: true
  end
end
