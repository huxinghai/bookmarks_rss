class CreateSiteInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :site_infos do |t|
      t.string :url
      t.string :title
      t.string :fovicon
      t.datetime :last_updated_at, :default => Time.now
      t.integer :user_id

      t.timestamps
    end

    add_index :site_infos, :url, :unique => true
  end
end