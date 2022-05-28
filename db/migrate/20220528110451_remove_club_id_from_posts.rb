class RemoveClubIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :club_id, :integer
  end
end
