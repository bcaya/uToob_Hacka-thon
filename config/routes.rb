Rails.application.routes.draw do
  root 'accounts#index'
  # resources :movies 
  
  devise_for :users
  resources :accounts
  

  # get '/comments', to: 'comments#index'
  # get '/commets/new', to: 'comments#new'
  # post '/comments', to: 'comments#create'
  # get '/comments/:id', to: 'comments#show'


  resources :movies do
    resources :comments
  end
end
