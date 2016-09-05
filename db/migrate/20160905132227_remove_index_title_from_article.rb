class RemoveIndexTitleFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_index :articles, [:title, :site_info_id]
    add_index :articles, [:link, :site_info_id], :unique => true
  end
end
