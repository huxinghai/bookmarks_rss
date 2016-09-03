class CreateArticlesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :articles_users, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.integer :article_id
      t.integer :user_id
    end

    add_index :articles_users, [:article_id, :user_id], unique: true
  end
end
