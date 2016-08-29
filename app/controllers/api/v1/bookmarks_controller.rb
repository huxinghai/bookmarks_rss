class Api::V1::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    data = params.require(:bookmarks)
    bookmarks = data.map do |param|
      options = param.permit(:provision_id, :parent_id, :index, :url, :title, :date_added, :date_group_modified)
      bookmark = current_user.bookmarks.find_or_initialize_by(provision_id: options[:provision_id])
      bookmark.assign_attributes(options)
      bookmark.save  
      bookmark
    end

    if bookmarks.any?{|b| b.valid? }
      head :ok
    else
      render json: {errors: "记录书签信息失败！"}, status: :unprocessable_entity
    end 
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    head :ok
  end

end
