require 'rails_helper'
RSpec.describe RecipeService do
  describe '#search' do
    it 'returns recipes of a given country', :vcr do
      search = RecipeService.search('france')
      expect(search).to be_a Hash
    end
  end
end
