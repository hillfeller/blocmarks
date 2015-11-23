class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    user = User.find(params[:sender])
    topic = Topic.find(params[:subject])
    bookmark = Bookmark.find(params["body-plain"])

    @user = User.find(params[:id]) if params[:id].present?
    unless @user
      @user = current_user
    end

    @topic = Topic.find(params[:id]) if params[:id].present?
    unless @topic
      @topic = current_topic
    end

    @bookmark = Bookmark.new.find(params[:topic_id])

    head 200
  end
end
