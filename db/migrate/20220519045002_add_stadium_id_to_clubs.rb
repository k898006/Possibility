class AddStadiumIdToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :stadium_id, :integer
  end
end
