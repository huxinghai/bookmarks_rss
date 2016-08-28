class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :current_user

 def current_user
   @current_user ||= User.find_by(provision_id: request.headers['Authorization'])
 end

  def authenticate_user!
    if current_user.nil?
      respond_to do |format|
        format.json{ render json: {errors: ["unauthorized"]}, status: :unauthorized }
      end
    end
  end
end
