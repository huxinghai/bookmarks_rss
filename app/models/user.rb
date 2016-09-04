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

  def room_name
    "room_#{id}"
  end

  def unread_articles
    Article.joins(:site_info).joins({site_info: :site_infos_users}).where("articles.created_at > ?", last_read_time).where(site_infos_users: {user_id: id})
  end

  def read_notify
    self.update_attribute(:last_read_time, DateTime.now)
    send_room_name_notify(0)
  end

  def send_notify
    send_room_name_notify(unread_articles.count)
  end

  private 
  def send_room_name_notify(number = 0)
    ActionCable.server.broadcast("articles_#{room_name}", {number: 99})
  end
end
