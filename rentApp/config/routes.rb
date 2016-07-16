Rails.application.routes.draw do
#USERS
  resources :users
  get '/users/:id', to: 'users#show'
  get '/', to: 'users#index', as: 'home'

#SESSIONS
  get "/signin", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#delete"
end
