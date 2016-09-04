class AddLastReadTimeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_read_time, :datetime, default: 'now()'
  end
end
