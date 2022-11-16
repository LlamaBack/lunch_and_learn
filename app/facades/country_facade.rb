class CountryFacade
  def self.capital(country)
    CountryService.capital(country)[0][:capitalInfo][:latlng]
  end

  def self.random
    CountryService.all_countries.map do |country|
      country[:name][:common]
    end.sample
  end
end
