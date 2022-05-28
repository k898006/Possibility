class ChangeColumnSettingToClubs < ActiveRecord::Migration[6.1]
  def change
    add_index :clubs, :name, unique: true
  end
end
