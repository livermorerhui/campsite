class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.text :location
      t.integer :user_id

      t.timestamps
    end
  end
end
