require 'rails_helper'

RSpec.describe Recipe do
  it 'exists and has attributes' do
    recipe_data = {
      recipe: {
        label: 'mango sticky rice',
        url: 'https://www.mangostickyrice.com',
        image: 'https://www.mangostickrice.com/image.png'
      }
    }
    country = 'thailand'

    new_recipe = Recipe.new(recipe_data, country)
    expect(new_recipe).to be_a(Recipe)
    expect(new_recipe.title).to eq('mango sticky rice')
    expect(new_recipe.url).to eq('https://www.mangostickyrice.com')
    expect(new_recipe.image).to eq('https://www.mangostickrice.com/image.png')
    expect(new_recipe.country).to eq('thailand')
  end
end