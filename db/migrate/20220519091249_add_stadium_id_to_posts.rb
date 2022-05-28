class AddStadiumIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :stadium_id, :integer
  end
end
