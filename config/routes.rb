Rails.application.routes.draw do
  root 'images#index'
  resources :users
  resources :images
  resources :comments

  post '/images/:category_name' => 'images#show_category'
  post '/images/:id' => 'images#comment'
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
end

# Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            users#index
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#       images GET    /images(.:format)            images#index
#              POST   /images(.:format)            images#create
#    new_image GET    /images/new(.:format)        images#new
#   edit_image GET    /images/:id/edit(.:format)   images#edit
#        image GET    /images/:id(.:format)        images#show
#              PATCH  /images/:id(.:format)        images#update
#              PUT    /images/:id(.:format)        images#update
#              DELETE /images/:id(.:format)        images#destroy
#     comments GET    /comments(.:format)          comments#index
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy
#       logout DELETE /logout(.:format)            sessions#destroy
#     sessions POST   /sessions(.:format)          sessions#create
#  new_session GET    /sessions/new(.:format)      sessions#new
