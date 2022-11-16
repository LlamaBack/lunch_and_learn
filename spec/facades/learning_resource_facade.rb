require 'rails_helper'
RSpec.describe LearningResourceFacade do
  context 'class methods' do
    describe '#build' do
      it 'creates learning resource from services', :vcr do
        laos_resource = LearningResourceFacade.build('laos')
        expect(laos_resource).to be_a LearningResource
        expect(laos_resource.id).to be nil
        expect(laos_resource.country).to eq('laos')
        expect(laos_resource.video).to be_a Hash

        image1 = laos_resource.images[0]
        expect(image1).to be_a Hash
      end
    end
  end
end