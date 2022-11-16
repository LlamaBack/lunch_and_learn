require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#search' do
    it 'creates an array of recipe objects from a given country', :vcr do
      search_results = RecipeFacade.search('thailand')
      expect(search_results).to be_an Array
      expect(search_results[0]).to be_a Recipe
    end
  end
end