class DeleteNameUniqueIndexFromClub < ActiveRecord::Migration[6.1]
  def change
    remove_index :clubs, :name
  end
end
