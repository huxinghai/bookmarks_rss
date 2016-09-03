class DropArticlesUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :articles_users
  end
end
