require 'rails_helper'
RSpec.describe CountryService do
  context 'Class Methods' do
    describe '#capital' do
      it 'returns the capital of a given country', :vcr do
        city_data = CountryService.capital('france')
        expect(city_data).to be_a Array
        expect(city_data[0][:capitalInfo][:latlng]).to be_a Array
        expect(city_data[0][:capitalInfo][:latlng][0]).to be_a Float
      end
    end
  end
end