class SiteInfo < ApplicationRecord

  belongs_to :user
  has_many :articles

  validates :user, presence: true

end
