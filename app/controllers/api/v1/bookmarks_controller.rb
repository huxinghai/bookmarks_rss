require 'feed_crawler'

class Api::V1::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    data = params.require(:bookmarks)
    bookmarks = data.map do |param|
      options = param.permit(:provision_id, :parent_id, :index, :url, :title, :date_added, :date_group_modified)
      begin
        url = FeedCrawler.fetch(options[:url]) 
        if url.present?
          res = FeedParser.new(url: url).parse.as_json
          site_info = current_user.site_infos.find_or_initialize_by(url: res[:url])
          site_info.title = res[:title]
          site_info.save!

          res[:items].each do |article|
            article = site_info.articles.find_or_initialize_by(title: article[:title])
            article.assign_attributes(article.slice(:link, :published, :author, :description, :content, :guid))
            article.save!
          end
        end
        head :ok
      rescue Exception => e
        render json: {errors: "记录书签信息失败！"}, status: :unprocessable_entity  
      end
    end

  end

  def destroy
    bookmark = Bookmark.find_by(provision_id: params[:id])
    bookmark.destroy if bookmark 
    head :ok
  end

end
