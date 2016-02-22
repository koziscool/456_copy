class PlaylistSelectionsController < ApplicationController

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
  
end
