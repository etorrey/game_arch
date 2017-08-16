class SearchHistoriesController < ApplicationController

  def index
    @search_histories = SearchHistory.sort_by(params[:sort]).paginate(page: params.fetch(:page, 1))
    @hide_sidebar=true
  end
  
end
