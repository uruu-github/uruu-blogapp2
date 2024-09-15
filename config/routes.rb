Rails.application.routes.draw do
  devise_for :users

  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]

    resource :like, only: [:create, :destroy]
  end

  #プロフィールはユーザーに対して複数ないので単数形でOK。
  resource :profile, only: [:show, :edit, :update]

end
