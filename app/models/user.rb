class User < ApplicationRecord

  validates :email, :provision_id, presence: true
  validates :email, uniqueness: true

  has_many :bookmarks
end
