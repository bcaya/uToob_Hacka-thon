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

  resources :accounts do
  member do
    get :add_movie
    get :add_movie_to
  end
end

end
