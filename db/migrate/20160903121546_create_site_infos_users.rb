class CreateSiteInfosUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :site_infos_users, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.integer :site_info_id
      t.integer :user_id
    end
    add_index :site_infos_users, [:site_info_id, :user_id], unique: true
  end
end
