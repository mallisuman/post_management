Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  resources :users do
    resources :posts
  end

  get 'home/index'
   
  resources :posts

  root 'home#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
