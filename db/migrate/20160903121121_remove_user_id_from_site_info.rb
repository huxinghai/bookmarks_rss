class RemoveUserIdFromSiteInfo < ActiveRecord::Migration[5.0]
  def change
    remove_column :site_infos, :user_id, :integer
  end
end
