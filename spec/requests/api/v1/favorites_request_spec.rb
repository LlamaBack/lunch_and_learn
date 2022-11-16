require 'rails_helper'

RSpec.describe 'Favorites endpoint' do
  let!(:user1) { User.create!(name: "John", email: "john@email.com", api_key: "awedwecrv34")}
  let!(:user2) { User.create!(name: "Jacob", email: "jacob@email.com", api_key: "2r34gf34f")}
  let!(:user2_fav1) { user2.favorites.create!(
    country: "thailand",
    recipe_link: "https://www.tastingtable.com/.....",
    recipe_title: "Crab Fried Rice (Khaao Pad Bpu)" )
  }

  describe 'happy path' do
    it 'returns user favorite data' do
      api_key = {
        "api_key": "2r34gf34f"
      }

      get api_v1_favorites_path, params: api_key
      expect(response.status).to eq(200)
      fav1 = JSON.parse(response.body, symbolize_names: true)[:data][0]
      expect(fav1[:type]).to eq 'favorite'
      expect(fav1[:attributes][:recipe_title]).to eq 'Crab Fried Rice (Khaao Pad Bpu)'
      expect(fav1[:attributes][:recipe_link]).to eq 'https://www.tastingtable.com/.....'
      expect(fav1[:attributes][:country]).to eq 'thailand'
      expect(fav1[:attributes]).to have_key :created_at
    end

    it 'returns user favorite data' do
      api_key = {
        "api_key": "awedwecrv34"
      }

      get api_v1_favorites_path, params: api_key
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to eq []
    end
  end

  describe 'sad path' do
    it 'returns error when given wrong key' do
      api_key = {
        "api_key": "oops wrong key",
      }

      get api_v1_favorites_path, params: api_key
      expect(response.status).to eq(400)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:error]).to eq('Invalid API Key')
    end
  end
end