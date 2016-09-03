class UsersController < ApplicationController

  def show
    @articles = current_user.articles.page(params[:page]).per(25)
    @articles = @articles.where(site_info_id: params[:site_id]) if params[:site_id].present?
  end

end
