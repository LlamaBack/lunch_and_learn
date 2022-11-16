require 'rails_helper'
RSpec.describe LearningResource do
  let!(:youtube_data) { { items: [{ id: { videoId: '123456' }, snippet: { title: 'VIDEO TITLE' } }] } }
  let!(:image_data) { { results:
    [
      { alt_description: 'pretty', urls: { full: 'path/test1' } },
      { alt_description: 'ugly', urls: { full: 'path/test2' } }
    ]
  } }
  let!(:country) { 'laos' }

  it 'exists and has attributes' do
    learning_resource1 = LearningResource.new(youtube_data, image_data, 'laos')
    expect(learning_resource1).to be_a LearningResource
    expect(learning_resource1.id).to be nil
    expect(learning_resource1.country).to eq('laos')
    expect(learning_resource1.video).to eq({ title: 'VIDEO TITLE', youtube_video_id: '123456' })

    image1 = learning_resource1.images[0]
    expect(image1).to eq ({ alt_tag: 'pretty', url: 'path/test1' })
  end
end
