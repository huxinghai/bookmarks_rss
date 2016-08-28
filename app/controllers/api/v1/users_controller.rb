class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(params.require(:user).permit(:email, :provision_id))
    render json: user
  end
end
