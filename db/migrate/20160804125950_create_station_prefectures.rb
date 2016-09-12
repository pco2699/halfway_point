class CreateStationPrefectures < ActiveRecord::Migration
  def change
    create_table :station_prefectures do |t|
      t.integer :line_cd
      t.string :line_name

      t.timestamps null: false
    end
  end
end
