class CountryService
  def self.capital(country)
    response = conn.get("v3.1/name/#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.all_countries
    response = conn.get('/v3.1/all')
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://restcountries.com')
  end
end