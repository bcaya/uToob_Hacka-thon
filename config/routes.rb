Rails.application.routes.draw do
  root 'accounts#index'
  resources :movies 
  
  devise_for :users
  resources :accounts
  

  get '/commentss', to: 'commentss#index'
  get '/commets/new', to: 'commentss#new'
  post '/comments', to: 'commentss#create'
  get '/commentss/:id', to: 'comments#show'


  resources :movies do
    resources :comments
  end
end
