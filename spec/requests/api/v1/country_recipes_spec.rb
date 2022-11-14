require 'rails_helper'
RSpec.describe 'country recipes' do
  it 'gets recipes by country' do
    get api_v1_recipes_path({ country: 'thailand' })
    expect(response).to be_successful
    recipes = JSON.parse(response.body, symbolize_names: true)
    expect(recipes[:data]).to be_an Array
  end
end