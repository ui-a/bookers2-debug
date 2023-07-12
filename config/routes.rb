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
    get 'daysearch' => 'users#search', as: 'daysearch'
  end

  get 'searches/search' => 'searches#search', as: 'search'
  get 'tagsearches/search' => 'tagsearches#search', as: 'tagsearch'

  resources :chats, only: [:create, :show]
  resources :rooms, only: [:create]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end