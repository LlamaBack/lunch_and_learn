require 'rails_helper'

RSpec.describe 'Adding Favorites' do
  let!(:user1) { User.create!(name: "John", email: "john@email.com", api_key: "awedwecrv34")}

  describe 'happy path' do
    it 'returns success message after adding favorite' do
      favorite = {
        "api_key": "awedwecrv34",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post api_v1_favorites_path, params: favorite
      expect(response.status).to eq(201)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:success]).to eq('Favorite added successfully')
    end
  end
end