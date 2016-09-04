class Article < ApplicationRecord
  max_paginates_per 100
  paginates_per 25

  belongs_to :site_info

  validates :site_info, presence: true
  private 
  
    
end
