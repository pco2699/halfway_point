class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.integer :pref_code
      t.string :pref_name

      t.timestamps null: false
    end
  end
end
