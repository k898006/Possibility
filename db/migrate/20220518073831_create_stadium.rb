class CreateStadium < ActiveRecord::Migration[6.1]
  def change
    create_table :stadiums do |t|
      t.string :name
      t.integer :club_id
      t.timestamps
    end
  end
end
