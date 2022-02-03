Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/producers', to:'producers#index'
  get '/producers/:id', to:'producers#show'
end
