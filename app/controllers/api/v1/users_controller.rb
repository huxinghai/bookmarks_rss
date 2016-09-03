class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    options = params.require(:user).permit(:email, :provision_id)
    user = User.find_or_initialize_by(email: options[:email])
    if user.persisted? && user.provision_id != options[:provision_id]
      render json: {}, status: :unauthorized and return
    else  
      user.provision_id = options[:provision_id]
    end
    user.authenticity_token = form_authenticity_token
    user.last_sign_in_at = DateTime.now  
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: :forbidden
    end
  end
end
