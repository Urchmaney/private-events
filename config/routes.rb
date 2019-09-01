Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users, only: %i[new create show index]
  resources :events, only: %i[new create show index]
  resources :invitations, only: %i[new create index]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/events/new', to: 'events#new'
  patch '/accept', to: 'invitations#accept'
end
