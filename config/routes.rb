Rails.application.routes.draw do
  root to: 'articles#index'
    # このように書くことでHelper(root_path)を使えるようになる。
    # get '/' => 'home#index' を上記に変更する。
    # 特に指定しなければhomeのindexを表示という意味になる。
end
