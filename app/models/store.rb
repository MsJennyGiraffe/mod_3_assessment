class Store
  attr_reader :name, :type, :id, :city, :distance, :phone_number
  def initialize(long_name, type, id, city, distance, phone_number)
    @name = long_name
    @type = type
    @id = id
    @city = city
    @distance = distance
    @phone_number = phone_number
  end

  def self.make_stores(zipcode, distance=25)
    best_buy_service = BestBuyService.new
    locations = best_buy_service.find_by_location(zipcode, distance)
    locations["stores"].map do |store|
      Store.new(
        store["name"],
        store["storeType"],
        store["storeId"],
        store["city"],
        store["distance"],
        store["phone"],
      )
    end
  end
end
