class UsersController < ApplicationController

  def show
    @articles = current_user.articles.page(params[:page]).per(25)
  end

end
