require 'rails_helper'
RSpec.describe PlacesFacade do
  context 'class methods' do
    describe '#tourism_sights' do
      it 'creates sights around a given lat and long', :vcr do
        expect(PlacesFacade.tourism_sights([48.87,2.33])).to be_a Array
        expect(PlacesFacade.tourism_sights([48.87,2.33])[0]).to be_a TourismSight
      end
    end
  end
end