require 'rails_helper'
RSpec.describe UnsplashService do
  describe '#photo_search' do
    it 'returns 10 images of a given country', :vcr do
      search = UnsplashService.photo_search('laos')
      expect(search).to be_a Hash
      expect(search[:results].length).to eq 10
      image1 = search[:results][0]
      expect(image1[:alt_description]).to be_a String
      expect(image1[:urls][:full]).to be_a String
    end
  end
end
