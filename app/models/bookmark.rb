class Bookmark < ApplicationRecord
  belongs_to :user

  validates :user, :url, presence: true
  validates :provision_id, presence: true, uniqueness: {scope: :user_id}

  after_create :update_user_last_date_added

  private
  def update_user_last_date_added
    
    user.update_attribute(:last_date_added, date_added) if date_added > user.last_date_added
  end
end
