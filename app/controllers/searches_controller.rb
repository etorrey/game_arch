class SearchesController < ApplicationController

  def index
  end

  def create
    if IGDB_CONNECTION.nil?
      flash[:failure] = "IGDB connection not established"
    else
      @results = IGDB_CONNECTION::Game.search(query: params[:query])
    end
  end
 
end
