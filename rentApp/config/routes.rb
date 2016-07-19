Rails.application.routes.draw do

#USERS
  resources :users do
    resources :reviews
  end
  get '/users/:id/reviews', to: "users#reviews"
  get '/users/:id', to: 'users#show'
  get '/', to: 'properties#index', as: 'home'
  get '/properties', to: 'properties#show'
#SESSIONS
  get "/signin", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  #REVIEWS

  put "/properties/:id/reviews/:id/like", to: "reviews#upvote", as: "like_reviews"
  put "/properties/:id/reviews/:id/dislike", to: "reviews#downvote", as: "dislike_reviews"

  #PROPERTIES
  resources :properties do
    resources :reviews
  end

end
