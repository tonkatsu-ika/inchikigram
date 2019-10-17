Rails.application.routes.draw do

  devise_for :users
  root        "posts#index"
  resources   :posts

  get '/post/hashtag/:name', to: "posts#hashtag"
  
end
