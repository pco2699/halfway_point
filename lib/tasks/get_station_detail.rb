class Tasks::GetStationDetail
  def self.execute
    conn = Faraday.new(:url => 'http://www.ekidata.jp') do |builder|
      builder.request  :url_encoded
      builder.response :logger
      builder.adapter  :net_http
    end
    @line_cds = StationPrefecture.where("prefecture in (13, 14)")

    @line_cds.each do |data|
      num = 1
      while true do
        response = conn.get '/api/s/' + data.line_cd.to_s + num.to_s.rjust(2, "0") + '.json'

        # 返却ステータスが200=失敗であればbreak
        if !response.success?
          break
        end
        json = ActiveSupport::JSON.decode(response.body.match(/\[(.+?)\]/)[1])
        StationDetail.create(pref_cd:json["pref_cd"], line_cd:json["line_cd"], station_cd:json["station_cd"], station_name:json["station_name"], longitude:json["lon"], latitude:json["lat"])

        num += 1
      end
    end

  end
end
