require 'rails_helper'

RSpec.describe 'Country Recipes endpoint' do
  describe 'happy path' do
    it 'gets a list of recipes from a given country', :vcr do
      get api_v1_recipes_path({ country: 'thailand' })
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes[:data]).to be_an Array

      recipe1 = recipes[:data][0]
      expect(recipe1).to have_key :id
      expect(recipe1[:type]).to eq('recipe')
      expect(recipe1[:attributes]).to be_a Hash
      expect(recipe1[:attributes].length).to eq 4
      expect(recipe1[:attributes].keys).to eq(%i[title url country image])
    end

    it 'gets a list of recipes from a random country if a country is not given', :vcr do
      get api_v1_recipes_path
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes[:data]).to be_an Array

      recipe1 = recipes[:data][0]
      expect(recipe1).to have_key :id
      expect(recipe1[:type]).to eq('recipe')
      expect(recipe1[:attributes]).to be_a Hash
      expect(recipe1[:attributes].length).to eq 4
      expect(recipe1[:attributes].keys).to eq(%i[title url country image])
    end
  end

  describe 'sad path' do
    it 'returns no data if input is not a country', :vcr do
      get api_v1_recipes_path({ country: 'sadfsadf' })
      expect(response).to be_successful
      no_data = JSON.parse(response.body, symbolize_names: true)
      expect(no_data).to eq({ data: [] })
    end
  end
end