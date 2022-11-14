require 'rails_helper'
RSpec.describe PlacesService do
  context 'Class Methods' do
    describe '#tourism_sights' do
      it 'returns tourism sights of within a latlng', :vcr do
        sights_data = PlacesService.tourism_sights([48.87, 2.33])
        expect(sights_data).to be_a Hash
        expect(sights_data[:features][0][:properties][:name]).to be_a String
        expect(sights_data[:features][0][:properties][:street]).to be_a String
        expect(sights_data[:features][0][:properties][:postcode]).to be_a String
        expect(sights_data[:features][0][:properties][:city]).to be_a String
        expect(sights_data[:features][0][:properties][:country]).to be_a String
        expect(sights_data[:features][0][:properties][:place_id]).to be_a String
      end
    end
  end
end