class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :provision_id
      t.string :parent_id
      t.integer :index
      t.string :url
      t.string :title
      t.integer :date_added , limit: 8
      t.integer :date_group_modified, limit: 8
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
