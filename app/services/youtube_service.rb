class YoutubeService
  def self.country_videos(country)
    query_params = {
      part: 'snippet',
      channelId: 'UCluQ5yInbeAkkeCndNnUhpw',
      q: country
    }
    response = conn.get('youtube/v3/search', query_params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://youtube.googleapis.com/') do |f|
      f.params[:key] = ENV['YOUTUBE_API_KEY']
    end
  end
end
