class AddUserIdAndMissionIdToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :user_id, :integer
    add_column :jobs, :mission_id, :integer
  end
end
