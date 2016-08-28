class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :provision_id
      t.string :parent_id
      t.integer :index
      t.string :url
      t.string :title
      t.double :date_added
      t.double :date_group_modified
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
