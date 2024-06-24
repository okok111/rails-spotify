class SongsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def search
    if params[:search_artist].present?
      @searchartists = RSpotify::Artist.search(params[:search_artist])
    end

    if params[:search_track].present?
      @searchtracks = RSpotify::Track.search(params[:search_track])
    end
  end

  def show
  end
end
