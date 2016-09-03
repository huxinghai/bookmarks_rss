class Article < ApplicationRecord
  attr_accessor :user

  has_and_belongs_to_many :users
  belongs_to :site_info

  validates :site_info, presence: true

  after_commit :create_articles_user, on: :create

  private 
  def create_articles_user
    user.articles_users.find_or_create_by(article: self) if user
  end
end
