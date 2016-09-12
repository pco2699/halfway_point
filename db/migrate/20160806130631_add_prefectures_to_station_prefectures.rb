class AddPrefecturesToStationPrefectures < ActiveRecord::Migration
  def change
    add_column :station_prefectures, :Prefecture, :integer
  end
end
