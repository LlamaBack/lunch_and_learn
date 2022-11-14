Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes, only: :index
      resources :tourists_sights, only: :index
    end
  end
end
