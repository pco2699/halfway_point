class Tasks::GetPrefecture
  def self.execute
    CSV.foreach('lib/assets/pref.csv') do |row|
      Prefecture.create(pref_code:row[0], pref_name:row[1])
    end
  end
end
