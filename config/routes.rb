Rails.application.routes.draw do
  root 'images#index'
  resources :users
  resources :images do
    resources :comments
  end

  get '/images/:category_name' => 'images#show_category'
  post '/images/:id' => 'images#comment'
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
end
