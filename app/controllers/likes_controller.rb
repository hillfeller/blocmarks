class LikesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized


  def create

    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: bookmark)

    authorize like
    if like.save
      flash[:notice] = "Bookmark liked."
    else
      flash[:error] = "Like failed."
    end

    redirect_to current_user
  end


  def destroy

    @like = current_user.likes.find(params[:id])

    authorize @like

    if @like.destroy
      flash[:notice] = "Bookmark unliked."
    else
      flash[:error] = "Unlike failed."
    end
      redirect_to current_user
  end
end
