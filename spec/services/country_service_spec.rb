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

    describe '#all_countries' do
      it 'returns array of all countries', :vcr do
        all_countries = CountryService.all_countries
        expect(all_countries).to be_a Array
        expect(all_countries[0]).to be_a Hash
        expect(all_countries[0][:name][:common]).to be_a String
      end
    end
  end
end