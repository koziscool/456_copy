class PlaylistsController < ApplicationController

  before_action :require_current_user, :only => [:edit, :new, :create, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = params[ :user_id]
    if @playlist.save
      flash[:success] = "playlist created"
      redirect_to playlist_path(@playlist)
    else
      flash[:error] = "playlist not created"
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def destroy
    @playlist = Playlist.find_(params[:id])

    if @playlist.destroy
      flash[:success] = "playlist destroyed"
      redirect_to user_path(current_user)
    else    
      flash[:error] = "playlist not destroyed"
      redirect_to root_url
    end
  end


  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
