Rails.application.routes.draw do
  root 'articles#index'  # ホームページを指定
  resources :articles
  get '/login', to: 'sessions#login' #ログイン画面
  get '/register', to: 'registrations#register' #サインアップ画面
end