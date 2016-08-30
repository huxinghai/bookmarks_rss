class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :link
      t.string :title, null: false, limit: 300
      t.datetime :published
      t.string :author
      t.text :description
      t.text :content
      t.string :guid
      t.integer :user_id, null: false
      t.boolean :status, default: true
      t.integer :site_info_id, null: false

      t.timestamps
    end

    add_index :articles, [:title, :site_info_id], :unique => true
  end
end
