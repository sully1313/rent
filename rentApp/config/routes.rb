Rails.application.routes.draw do

#USERS
  resources :users do
    resources :reviews
  end
  get '/users/:id/reviews', to: "users#reviews"
  get '/users/:id', to: 'users#show'
  get '/', to: 'users#index', as: 'home'

#SESSIONS
  get "/signin", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  #REVIEWS
  resources :reviews

  put "/properties/:id/reviews/:id/like", to: "reviews#upvote", as: "like_reviews"
  put "/properties/:id/reviews/:id/dislike", to: "reviews#downvote", as: "dislike_reviews"

  #PROPERTIES
  resources :properties do
    resources :reviews
  end
  get "properties/:id/reviews", to: "properties#reviews"
end
