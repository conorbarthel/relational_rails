Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/producers/:id/discs/new', to:'producer_discs#new'
  get '/producers/:id/discs', to:'producer_discs#index'
  post '/producers/:id/discs', to:'producer_discs#create'

  get '/producers/:id/edit', to:'producers#edit'
  get '/producers', to:'producers#index'
  get '/producers/new', to:'producers#new'
  get '/producers/:id', to:'producers#show'
  delete '/producers/:id', to:'producers#destroy'
  post '/producers', to:'producers#create'
  patch '/producers/:id', to:'producers#update'

  get '/discs', to:'discs#index'
  get '/discs/:id/edit', to:'discs#edit'
  get '/discs/:id', to:'discs#show'
  patch 'discs/:id', to:'discs#update'
  delete '/discs/:id', to:'discs#destroy'

  get '/directors', to: 'directors#index'
  get '/directors/new', to: 'directors#new'
  get '/directors/:id', to: 'directors#show'
  get '/directors/:id/edit', to: 'directors#edit'
  get '/directors/:id/movies', to: 'director_movies#index'
  get '/directors/:id/movies/new', to: 'director_movies#new'
  post '/directors/:id/movies', to: 'director_movies#create'
  patch '/directors/:id', to: 'directors#update'
  post '/directors', to: 'directors#create'
  delete '/directors/:id', to: 'directors#destroy'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  get '/movies/:id/edit', to: 'movies#edit'
  patch '/movies/:id', to: 'movies#update'
  delete '/movies/:id', to: 'movies#destroy'
end
