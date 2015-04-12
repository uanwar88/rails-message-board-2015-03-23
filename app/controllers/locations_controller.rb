class LocationsController < ApplicationController
  before_action :store_referrer

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @boards = @location.boards
  end

end
