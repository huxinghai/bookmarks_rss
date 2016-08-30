class Article < ApplicationRecord

  belongs_to :user
  belongs_to :site_info

  validates :user, :site_info, presence: true

  before_validation(on: :create) do 
    init_user
  end

  private 

  def init_user
    self.user_id = site_info.user_id
  end
end
