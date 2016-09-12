class MapController < ApplicationController
  def index
    @coords = session[:coord]
    latitude = 0
    longitude = 0
    @coords.each do |coord|
      latitude += coord[0].to_f
      longitude += coord[1].to_f
    end
    latitude /= @coords.count
    longitude /= @coords.count

    ans = StationDetail.nearby_station(latitude, longitude)

    @latitude = ans.first.latitude
    @longitude = ans.first.longitude
    @infowindow = "this is the answer"
=begin
    @latitude = coords[0].to_f
    @longitude = coords[1].to_f
    @infowindow = "this is the answer"
=end
#    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
#      marker.lat user.latitude
#      marker.lng user.longitude
#      marker.infowindow user.description
#      marker.json({title: user.title})
#    end
  end
end
