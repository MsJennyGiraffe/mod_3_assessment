class BestBuyService
  def find_by_location(zipcode, distance)
    conn = Faraday.new("https://api.bestbuy.com/v1/")
    response = conn.get("stores(area(#{zipcode},#{distance}))?format=json&show=storeId,storeType,name,phone,city,distance&pageSize=25&apiKey=#{ENV['BEST_BUY_KEY']}")
    JSON.parse(response.body)
  end
end
