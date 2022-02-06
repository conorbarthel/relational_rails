Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/producers', to:'producers#index'
  get '/producers/new', to:'producers#new'
  get '/producers/:id', to:'producers#show'
  get '/discs', to:'discs#index'
  get '/discs/:id', to:'discs#show'
  get '/producers/:id/discs', to:'producer_discs#index'
  post '/producers', to:'producers#create'
  get '/directors', to: 'directors#index'
  get '/directors/:id', to: 'directors#show'
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  get '/directors/:id/movies', to: 'director_movies#index'
end
