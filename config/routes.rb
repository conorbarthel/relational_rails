Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/producers', to:'producers#index'
  get '/producers/:id', to:'producers#show'
  get '/discs', to:'discs#index'
  get '/directors', to: 'directors#index'
  get '/directors/:id', to: 'directors#show'
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
end
