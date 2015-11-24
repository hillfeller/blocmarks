class BookmarksController < ApplicationController
  before_action :set_topic

  def show
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = @topic.bookmarks.find(params[:id])

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash[:error] = "Bookmark was not saved"
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])


    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
