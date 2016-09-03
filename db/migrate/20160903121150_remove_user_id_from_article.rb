class RemoveUserIdFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :user_id, :integer
  end
end
