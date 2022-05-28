class RemoveStadiumIdFromClubs < ActiveRecord::Migration[6.1]
  def change
    remove_column :clubs, :stadium_id, :integer
  end
end
