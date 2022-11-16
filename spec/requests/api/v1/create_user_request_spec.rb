require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'happy path' do
    it 'User is registered through json params' do
      user = {
        "name": 'Athena Dao',
        "email": 'athenadao@bestgirlever.com'
      }
      post api_v1_users_path, params: user
      expect(response.status).to eq(201)
    end
  end
  describe 'sad path' do
    it 'User cannot be registered with email that is already taken' do
      user = {
        "name": 'Athena Dao',
        "email": 'athenadao@bestgirlever.com'
      }
      post api_v1_users_path, params: user
      post api_v1_users_path, params: user
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:email][0]).to eq('has already been taken')
    end
  end
end
