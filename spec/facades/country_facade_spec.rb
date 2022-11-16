require 'rails_helper'
RSpec.describe CountryFacade do
  context 'class methods' do
    describe '#capital' do
      it 'returns the lat and long of a given country capital', :vcr do
        expect(CountryFacade.capital('france')).to be_a Array
      end
    end

    describe '#random' do
      it 'returns random country', :vcr do
        expect(CountryFacade.random).to be_a String
      end
    end
  end
end