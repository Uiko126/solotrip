Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :tweets do
    resources :feedbacks, only: [:create]
  end
  
  get 'sends/spot' => 'sends#spot'
  get 'sends/shop' => 'sends#shop'
  get 'sends/accommodation' => 'sends#accommodation'
 
  resources :sends 

  get 'home/index' => 'home#index'
  get 'home/guide' => 'home#guide'
  root 'home#index'
  
end
