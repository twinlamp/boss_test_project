class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    respond_to do |format|
      format.html  {
        if @location.save
          redirect_to locations_path, notice: 'Location was successfully created.'
        else
          render action: 'new'
        end
      }
    end
  end

  private

  def location_params
    res = params.require(:location).permit(:name, :area)
    res[:area] = RGeo::GeoJSON.decode(res[:area], json_parser: :json) if res[:area]
    res
  end
end