class PlaylistSelectionsController < ApplicationController

  before_action :require_current_user


  def create
    @playlist_selection = PlaylistSelection.new( playlist_selection_params )
    if @playlist_selection.save
      flash[:success] = "added to playlist successfully!"
      redirect_to root_path
    else
      if !signed_in_user?
         flash[:error] = "not added successfully!"
         render :new
      else
        flash[:error] = "not added successfully!"
        redirect_to root_url
      end   
    end

  end

  def destroy
    @playlist_selection = PlaylistSelection.find(params[:id])
    if @playlist_selection.destroy
      flash[:success] = "selection removed!"
      redirect_to root_url
    else    
      flash[:error] = "selection not removed!"
      redirect_to root_url
    end
  end
  

  def playlist_selection_params
     params.require(:playlist_selection).permit( :song_id, :playlist_id )
  end

end
