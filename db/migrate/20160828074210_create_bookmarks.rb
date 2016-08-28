class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :provision_id
      t.string :parent_id
      t.integer :index
      t.string :url
      t.string :title
      t.integer :date_added
      t.integer :date_group_modified
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
