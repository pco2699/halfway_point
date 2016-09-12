class StationDetail < ActiveRecord::Base
  def self.nearby_station(lat, lng)
    find_by_sql(['select id, latitude, longitude, ROUND(POWER(ABS(latitude - ?), 2) + POWER(ABS(longitude - ?), 2), 15) as distance from station_details order by distance asc limit 1', lat, lng])
  end
end
