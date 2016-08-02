class Store < OpenStruct

  def self.make_stores(zipcode, distance)
    best_buy_service = BestBuyService.new
    locations = best_buy_service.find_by_location(zipcode, distance)
    locations["stores"].each do |store|
      store = OpenStruct.new
      store.long_name = store["name"]
      store.type = store["storeType"]
      store.id = store["storeId"]
      # store.city
      # store.distance
      # store.phone_number
    end
  end
end
