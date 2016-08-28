class Bookmark < ApplicationRecord
  belongs_to :user

  validates :user, :url, presence: true
  validates :provision_id, presence: true, uniqueness: {scope: :user_id}
end
