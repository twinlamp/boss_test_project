class Location < ActiveRecord::Base
  validates_presence_of :name, :area

  def coordinates
    RGeo::GeoJSON.encode(area)['coordinates'][0]
  end

  def google_coordinates
    RGeo::GeoJSON.encode(area)['coordinates'][0].map{|point| {lat: point[1], lng: point[0]}}
  end
end

