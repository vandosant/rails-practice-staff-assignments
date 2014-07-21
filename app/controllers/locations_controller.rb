class LocationsController < ApplicationController

  def index
    @locations = Location.order(:name)
  end

end