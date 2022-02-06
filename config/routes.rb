Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/producers', to:'producers#index'
  get '/producers/:id', to:'producers#show'
  get '/discs', to:'discs#index'
  get '/discs/:id', to:'discs#show'
  get '/producers/:id/discs', to:'producer_discs#index'

  get '/directors', to: 'directors#index'
  get '/directors/new', to: 'directors#new'
  get '/directors/:id', to: 'directors#show'
  get '/directors/:id/edit', to: 'directors#edit'
  get '/directors/:id/movies', to: 'director_movies#index'
  post '/directors/:id', to: 'directors#update'
  post '/directors', to: 'directors#create'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
end
