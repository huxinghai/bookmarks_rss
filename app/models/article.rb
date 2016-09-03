class Article < ApplicationRecord

  belongs_to :site_info

  validates :site_info, presence: true

  after_commit :create_articles_user, on: :create

  private 
end
