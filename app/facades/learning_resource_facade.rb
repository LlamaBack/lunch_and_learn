class LearningResourceFacade
  def self.build(country)
    youtube_data = YoutubeService.country_videos(country)
    unsplash_data = UnsplashService.photo_search(country)
    LearningResource.new(youtube_data, unsplash_data, country)
  end
end
