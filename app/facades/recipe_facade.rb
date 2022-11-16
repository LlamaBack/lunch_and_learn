class RecipesFacade
  def self.search(country)
    recipe_data = RecipeService.search(country)
    recipe_data[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end