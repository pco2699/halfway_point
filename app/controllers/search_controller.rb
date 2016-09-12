class SearchController < ApplicationController
  def show
    place = params[:place]
    Geocoder.configure( :language  => :ja, :units => :km )
    str = []
    place.each do |ps|
      str.push(Geocoder.coordinates(ps))
    end
    session[:coord] = str
    redirect_to controller: 'map', action: 'index'
  end
end
