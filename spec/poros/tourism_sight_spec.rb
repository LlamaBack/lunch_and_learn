require 'rails_helper'

RSpec.describe TourismSight do 
  it 'Tourism Sight has attributes', :vcr do 
    sight = PlacesFacade.tourism_sights([48.87, 2.33])[0]
    expect(sight.id).to eq(nil)
    expect(sight.name).to be_a String
    expect(sight.address).to be_a String
    expect(sight.place_id).to be_a String
  end
end