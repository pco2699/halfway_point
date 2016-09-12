class CreateStationDetails < ActiveRecord::Migration
  def change
    create_table :station_details do |t|
      t.integer :pref_cd
      t.integer :line_cd
      t.integer :station_cd
      t.string :station_name
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
