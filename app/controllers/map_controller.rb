class MapController < ApplicationController
  def index
    @users = User.all
    latitude = 0
    longitude = 0

    @users.each do |user|
      latitude += user.latitude
      longitude += user.longitude
    end
    latitude /= User.count
    longitude /= User.count

    @latitude = latitude
    @longitude = longitude
    @infowindow = "this is the answer"

#    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
#      marker.lat user.latitude
#      marker.lng user.longitude
#      marker.infowindow user.description
#      marker.json({title: user.title})
#    end
  end
end
