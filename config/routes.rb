Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#show'

  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions/new', to: 'sessions#create'
  delete '/sessions/delete', to: 'sessions#destroy'
end
