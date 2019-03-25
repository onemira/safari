Rails.application.routes.draw do
resources :animals
  # If a user send a GET request to '/animals'
  # call the index method on our controller
  # called AnimalsController
  # get '/animals', to: 'animals#index'
  # get '/animals/:id/:species', to: 'animals#show'
  # get '/animals/:id/:species', to: 'animals#show'
  # post '/animals', to: 'animals#create'
  # delete '/animals/:id', to: 'animals#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
