class LikesController < ApplicationController
  before_action :authenticate_user!

  def create

    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize @like
    if like.save
      flash[:notice] = "Bookmark liked."
    else
      flash[:error] = "Like failed."
    end

    redirect_to [bookmark.topic, bookmark]
  end


  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize @like
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params

    if like.destroy
      flash[:notice] = "Bookmark unliked."
    else
      flash[:error] = "Unlike failed."
    end
      redirect_to [bookmark.topic, bookmark]
  end
end
