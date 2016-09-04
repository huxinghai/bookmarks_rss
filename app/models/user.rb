class User < ApplicationRecord
  max_paginates_per 100
  paginates_per 25

  attr_accessor :authenticity_token

  validates :email, :provision_id, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  has_many :bookmarks
  has_and_belongs_to_many :site_infos
  has_many :site_infos_users
end
