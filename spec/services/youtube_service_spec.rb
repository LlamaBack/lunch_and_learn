require 'rails_helper'
RSpec.describe YoutubeService do
  describe '#country_videos' do
    it 'returns videos of a given country', :vcr do
      search = YoutubeService.country_videos('laos')
      expect(search).to be_a Hash
      video1 = search[:items][0]
      expect(video1[:id][:videoId]).to eq 'uw8hjVqxMXw'
      expect(video1[:snippet][:title]).to eq 'A Super Quick History of Laos'
    end
  end
end
