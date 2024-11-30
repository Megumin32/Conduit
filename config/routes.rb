Rails.application.routes.draw do
  root 'articles#home'  # ホームページを指定
  resources :articles
  get '/login', to: 'sessions#login' #ログイン画面
  get '/register', to: 'registrations#register' #サインアップ画面
end