class SearchController < ApplicationController
  def index
    @stores = Store.make_stores(params[:search])
  end
end
