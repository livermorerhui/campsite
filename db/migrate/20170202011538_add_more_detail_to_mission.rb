class AddMoreDetailToMission < ActiveRecord::Migration[5.0]
  def change
    add_column :missions, :contact_email, :string
  end
end
