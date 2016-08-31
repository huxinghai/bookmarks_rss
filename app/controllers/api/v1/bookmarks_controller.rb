require 'feed_crawler'

class Api::V1::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    data = params.require(:bookmarks)
    data.each do |param|
      options = param.permit(:url) #:title, :date_added, :date_group_modified, :provision_id, :parent_id, :index
      SiteInfo.crawler_articles(options[:url])
    end
    
    head :ok
  end

  def destroy
    bookmark = Bookmark.find_by(provision_id: params[:id])
    bookmark.destroy if bookmark 
    head :ok
  end

end
