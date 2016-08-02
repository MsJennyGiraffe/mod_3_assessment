class SearchController < ApplicationController
  def index
    @stores = Store.make_stores(params[:id])
  end

  def show

  end
end
