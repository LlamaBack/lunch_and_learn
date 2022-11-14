class PlacesService
  def self.tourism_sights(latlng)
    query_params = {
      apiKey: ENV['PLACES_API_KEY'],
      categories: 'tourism.sights',
      filter: "circle:#{latlng[1]},#{latlng[0]},20000"
    }
    response = conn.get('v2/places', query_params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.geoapify.com')
  end
end