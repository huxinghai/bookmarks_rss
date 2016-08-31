class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :site_info

  validates :user, :url, presence: true
  validates :provision_id, presence: true, uniqueness: {scope: :user_id}

  after_create :update_user_last_date_added

  class << self

    def find_or_create(options = {})
      obj = self.find_or_initialize_by(provision_id: options[:provision_id])
      obj.assign_attributes(options)
      obj.save
      obj
    end
  end

  private
  def update_user_last_date_added
    user.update_attribute(:last_date_added, date_added) if date_added > user.last_date_added
  end
end
