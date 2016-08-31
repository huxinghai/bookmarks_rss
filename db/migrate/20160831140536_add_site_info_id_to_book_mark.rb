class AddSiteInfoIdToBookMark < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :site_info_id, :integer
  end
end
