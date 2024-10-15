Rails.application.routes.draw do
  devise_for :users

  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]

    resource :like, only: [:create, :destroy]
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  #プロフィールはユーザーに対して複数ないので単数形でOK。
  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]

  resources :attachments, only: [:create]  # POSTリクエスト用のルートを追加

end
