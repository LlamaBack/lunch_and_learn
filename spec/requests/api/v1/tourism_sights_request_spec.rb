require 'rails_helper'
RSpec.describe 'Tourism Sights Endpoint' do
  it 'gets a list of sights from a given country', :vcr do
    get api_v1_tourists_sights_path({ country: 'france' })
    expect(response).to be_successful
    sights = JSON.parse(response.body, symbolize_names: true)
    expect(sights[:data]).to be_an Array
    expect(sights[:data][0]).to have_key :id
    expect(sights[:data][0][:type]).to eq('tourist_sight')
    expect(sights[:data][0][:attributes]).to be_a Hash
    expect(sights[:data][0][:attributes][:name]).to be_a String
    expect(sights[:data][0][:attributes][:address]).to be_a String
    expect(sights[:data][0][:attributes][:place_id]).to be_a String
  end
end