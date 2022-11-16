require 'rails_helper'
RSpec.describe 'Country Learning Resources endpoint' do
  describe 'happy path' do
    it 'creates a learning resource for a given country', :vcr do
      get api_v1_learning_resources_path({ country: 'laos' })
      expect(response).to be_successful

      learning_resource1 = JSON.parse(response.body, symbolize_names: true)
      expect(learning_resource1).to be_a Hash

      expect(learning_resource1[:data][:id]).to be_nil
      expect(learning_resource1[:data][:type]).to eq 'learning_resource'
      expect(learning_resource1[:data][:attributes]).to be_a Hash

      attributes = learning_resource1[:data][:attributes]

      expect(attributes[:country]).to eq('laos')
      expect(attributes[:video][:title]).to be_a String
      expect(attributes[:video][:youtube_video_id]).to be_a String

      image1 = attributes[:images][0]
      expect(image1[:alt_tag]).to be_a String
      expect(image1[:url]).to be_a String
    end
  end

  describe 'sad path' do
    it 'returns empty array and hash if no images or videos', :vcr do
      get api_v1_learning_resources_path({ country: 'asdfsafwefwefrbv333346g' })
      learning_resource1 = JSON.parse(response.body, symbolize_names: true)
      expect(learning_resource1[:data][:attributes][:images]).to eq []
      expect(learning_resource1[:data][:attributes][:video]).to eq({})
    end
  end
end
