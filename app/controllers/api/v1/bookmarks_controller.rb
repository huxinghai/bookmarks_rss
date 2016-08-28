class Api::V1::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    options = params.require(:bookmark).permit(:provision_id, :parent_id, :index, :url, :title, :date_added, :date_group_modified)
    bookmark = current_user.bookmarks.find_or_initialize_by(provision_id: options[:provision_id])
    bookmark.attributes(options)
    if bookmark.save
      render json: bookmark
    else
      render json: {errors: bookmark.errors.full_messages}, status: :unprocessable_entity
    end 
  end
end
