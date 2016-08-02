class StoresController < ApplicationController
  def show
    @store = params[:store]
  end
end
