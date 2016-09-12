class Tasks::GetPrefectureLine
  def self.execute
    conn = Faraday.new(:url => 'http://www.ekidata.jp') do |builder|
      builder.request  :url_encoded
      builder.response :logger
      builder.adapter  :net_http
    end
    # 全 47都道府県の駅データを取得
    for num in 1..47 do
      # http://www.ekidata.jp/api/p/(都道府県コード).jsonを取得
      response = conn.get '/api/p/' + num.to_s + '.json'

      # もらったレスポンスを改行で区切る(頭に変なJavascriptが埋め込まれているため)
      line = response.body.split("\n")
      
      line2 = line[2].split(" ")

      json = ActiveSupport::JSON.decode(line2[2])
      json["line"].each do |data|
        StationPrefecture.create(line_cd:data["line_cd"], line_name:data["line_name"], Prefecture:num)
      end
      sleep(2)
    end
  end
end
