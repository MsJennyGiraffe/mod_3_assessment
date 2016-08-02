class BestBuyService

  def self.find_by_location(zipcode, distance)
    response = Faraday.new("https://api.bestbuy.com/v1/stores(postalCode=#{zipcode})?format=json&show=storeId,city,region&apiKey=#{ENV["BEST_BUY_KEY"]}")
    byebug
    JSON.parse(response.body)
  end
end
