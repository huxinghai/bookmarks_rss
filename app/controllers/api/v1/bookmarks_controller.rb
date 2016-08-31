require 'feed_crawler'

class Api::V1::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    data = params.require(:bookmarks)
    data.each do |param|
      options = param.permit(:url, :date_added, :title, :date_group_modified, :provision_id, :parent_id, :index)
      SiteInfo.enqueue_bookmark(current_user, options)
    end
    head :ok
  end

  def destroy
    bookmark = Bookmark.find_by(provision_id: params[:id])
    bookmark.destroy if bookmark 
    head :ok
  end

end
