class ArticlesController < ApplicationController

  def index
    @articles = Article.joins(:site_info).joins({site_info: :site_infos_users}).where(site_infos_users: {user_id: current_user.id})
    @articles = @articles.order(created_at: :desc).page(params[:page]).eager_load(:site_info)
    @articles = @articles.where(site_info_id: params[:site_id]) if params[:site_id].present?
    current_user.read_notify
  end

  def show
    ActionCable.server.broadcast("articles", {message: 1, user: 2})
    render json: {}
  end
end