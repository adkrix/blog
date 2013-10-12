Blog::Application.routes.draw do
  devise_for :users
  root to: 'statics#home'
  resources :posts
  resources :comments, only: [:create, :destroy]
end
