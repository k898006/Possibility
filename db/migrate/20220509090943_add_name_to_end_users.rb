class AddNameToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :name, :string
  end
end
