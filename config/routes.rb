Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users,only: [:show,:index,:edit,:update] do
    member do
      # フォローとフォロワー一覧ページのルーティング
      get :following, :followers
    end
    # フォロー&アンフォローのためのルーティング
    resource :relationships, only: [:create, :destroy]
  end

  resources :books do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get "search" => "searches#search"

end