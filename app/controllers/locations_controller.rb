class LocationsController < ApplicationController
  def index
    #in production, geocoder should detect location based on IP
    if !session[:location]
      session[:location] = 1
    end
    redirect_to location_path(session[:location])
  end

  def show
    render text: "Now at location #{params[:id]}"
  end

end
