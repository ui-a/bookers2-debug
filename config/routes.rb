Rails.application.routes.draw do
  get 'rooms/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end

  get 'searches/search' => 'searches#search', as: 'search'

  resources :chats, only: [:create, :show]
  resources :rooms, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end