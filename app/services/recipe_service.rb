class RecipeService
  def self.search(query)
    query_params = {
      type: 'public',
      q: query,
      field: %w[label image url]
    }
    response = conn.get('api/recipes/v2', query_params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.edamam.com') do |f|
      f.params[:app_key] = ENV['EDAMAM_API_KEY']
      f.params[:app_id] = ENV['EDAMAM_API_ID']
    end
  end
end