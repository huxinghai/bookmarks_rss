class AddLastDateAddedAndLastSignInAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_date_added, :integer, limit: 8, default: 0
    add_column :users, :last_sign_in_at, :datetime
  end
end
