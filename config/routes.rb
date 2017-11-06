Rails.application.routes.draw do
  resources :stations
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'api/v1/stations'=>'stations#stationsXroutes'

  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      get     "/stations",     to: "api_stations#stationsXroutes"
    end
  end


end
