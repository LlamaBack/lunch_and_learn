class UnsplashService
  def self.photo_search(country)
    # query_params = {
    #   query: country
    # }
    response = conn.get('search/photos', { query: country })
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.unsplash.com/') do |f|
      f.params[:client_id] = ENV['UNSPLASH_API_KEY']
    end
  end
end