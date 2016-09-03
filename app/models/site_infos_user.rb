class SiteInfosUser < ApplicationRecord

  belongs_to :site_info
  belongs_to :user
  
end