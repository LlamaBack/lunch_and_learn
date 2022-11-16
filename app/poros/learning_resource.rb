class LearningResource
  attr_reader :id, :country, :images, :video

  def initialize(youtube_data, image_data, country)
    @id = nil
    @country = country
    @video = find_video(youtube_data)
    @images = top_images(image_data)
  end

  def find_video(youtube_data)
    if youtube_data[:items].empty?
      {}
    else
      {
        title: youtube_data[:items][0][:snippet][:title],
        youtube_video_id: youtube_data[:items][0][:id][:videoId]
      }
    end
  end

  def top_images(image_data)
    image_data[:results].map do |image|
      {
        alt_tag: image[:alt_description],
        url: image[:urls][:full]
      }
    end
  end
end
