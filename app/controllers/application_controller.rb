class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :current_user, :authenticate_user!

  helper_method :current_user

 def current_user
   @current_user ||= User.last #find_by(id: session[:user_id])
 end

  def authenticate_user!
    if current_user.nil?
      respond_to do |format|
        format.json{ render json: {errors: ["unauthorized"]}, status: :unauthorized }
        format.html{ redirect_to root_path }
      end
    end
  end

  def set_session_user(user)
    session[:user_id] = user.id
  end
end
