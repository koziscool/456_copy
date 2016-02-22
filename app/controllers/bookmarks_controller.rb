class BookmarksController < ApplicationController

  before_action :require_current_user

  def create
    @bookmark = Bookmark.new( bookmark_params )

    @bookmark.user_id =  current_user.id

    if @bookmark.save
      flash[:success] = "successfully marked"
      redirect_to :back
    else
      if !signed_in_user?
         flash[:error] = "no bookmark"
         render :new
      else
         flash[:error] = "no bookmark"
         redirect_to root_url
      end   
    end
  end

  def destroy

    @bookmark = Bookmark.find_by(params[:id])

    if !@bookmark
      flash[:error] = "No such bookmark to un-bookmark!"  
      redirect_to root_url
    elsif @bookmark.destroy
      flash[:success] = "Un-Bookmarked successfully!"
      redirect_to login_path
    else
      if !signed_in_user?
        flash[:error] = "Could not UnBookmark!"
        render :new
      else
        flash[:error] = "Coudld not Unbookmark!"
        redirect_to root_url
      end
    end
  end

  def bookmark_params
    params.require(:bookmark).permit( :bookmarkable_type, :bookmarkable_id )
  end
end
