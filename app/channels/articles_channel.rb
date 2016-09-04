class ArticlesChannel < ApplicationCable::Channel

  def subscribed
    stream_from "notify_#{params[:room]}"
  end

end