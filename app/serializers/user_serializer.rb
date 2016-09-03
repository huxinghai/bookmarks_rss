class UserSerializer < ApplicationSerializer
  attributes :email, :provision_id, :last_date_added, :authenticity_token
  
end