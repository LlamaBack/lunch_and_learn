class LearningResourceFacade
  def self.capital(country)
    YoutubeService.country_videos(country)
    UnsplashService.photo_search(country)

  end
end
