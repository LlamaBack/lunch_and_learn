class CountryFacade
  def self.capital(country)
    CountryService.capital(country)[0][:capitalInfo][:latlng]
  end

  def self.random
    country = CountryService.random
    results = RecipeService.search(country)
    create_recipes(results, country)
  end
end
