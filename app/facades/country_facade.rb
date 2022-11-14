class CountryFacade
  def self.capital(country)
    CountryService.capital(country)[0][:capitalInfo][:latlng]
  end
end
