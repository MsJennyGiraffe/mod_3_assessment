class Store
  def initialize

  end

  def self.make_stores(zipcode, distance)
    best_buy_service = BestBuyService.new
    locations = best_buy_service.find_by_location(zipcode, distance)
    locations.each do |store|
      byebug
      store.long_name
      # store.city
      # store.distance
      # store.phone_number
      # store.type
    end
  end
end
