class ChangeColumnDefaultToClubs < ActiveRecord::Migration[6.1]
  def change
    change_column_default :clubs, :division, from: nil, to: 0
  end
end
