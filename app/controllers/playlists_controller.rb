class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.create(playlist_params)
    # playlist_params[:song_ids].each do |id|
    #   @playlist.playlistsongs.create(song_id: id)
    # end
    redirect_to @playlist
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
