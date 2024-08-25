Rails.application.routes.draw do
  root to: 'home#index' #先のように書くことでHelperを使えるようになる。
  # get '/' => 'home#index' 上記に変更する。
  # 特に指定しなければhomeのindexを表示という意味になる。
  get '/about' => 'home#about'
end
