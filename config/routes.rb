Rails.application.routes.draw do
  root 'articles#home'  # ホームページを指定
  
  resources :articles, only: [:show, :new, :create, :edit, :update, :destroy]  # 記事の各アクションを設定
end