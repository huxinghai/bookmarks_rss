class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    options = params.require(:user).permit(:email, :provision_id)
    user = User.find_or_initialize_by(email: options[:email])
    if user.persisted? && user.provision_id != options[:provision_id]
      render json: {}, status: :unauthorized and return
    else  
      user.provision_id = options[:provision_id]
    end
    user.last_sign_in_at = DateTime.now  
    set_session_user(user)
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: :forbidden
    end
  end
end
