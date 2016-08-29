class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_or_create_by(params.require(:user).permit(:email, :provision_id))
    user.last_sign_in_at = DateTime.now
    render json: user
  end
end
