class CreateTemporaryPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :temporary_posts do |t|
      t.string :title
      t.text :caption
      t.integer :user_id
      t.integer :post_id
      t.integer :stadium_id
      t.timestamps
    end
  end
end
