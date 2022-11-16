class Recipe
  attr_reader :id, :title, :url, :country, :image

  def initialize(recipe_data, country)
    @id = nil
    @title = recipe_data[:recipe][:label]
    @image = recipe_data[:recipe][:image]
    @url = recipe_data[:recipe][:url]
    @country = country
  end
end