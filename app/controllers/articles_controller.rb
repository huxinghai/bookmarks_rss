class ArticlesController < ApplicationController

  def index
    @articles = Article.joins(:site_info).joins({site_info: :site_infos_users}).where(site_infos_users: {user_id: current_user.id})
    @articles = @articles.page(params[:page]).eager_load(:site_info)
    @articles = @articles.where(site_info_id: params[:site_id]) if params[:site_id].present?
  end
end