Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get 'posts/search'

  resources :users
  resources :posts do
    resources :comments, only: :create
  end
end
