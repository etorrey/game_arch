class SearchesController < ApplicationController

  def index
  end

  def create
    if IGDB_CONNECTION.nil?
      flash[:failure] = "IGDB connection not established"
    else
      SearchHistory.create_or_update_total(params[:query])
      @results = IGDB_CONNECTION::Game.search(query: params[:query])
    end
  end
 
end
