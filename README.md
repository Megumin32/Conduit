# Conduit
## 概要
Ruby on Railsの学習のために`https://realworld-docs.netlify.app/introduction/`を参考に作成したWebアプリ．記事のCRUD処理を実装した．

## 使い方
- 初期設定
```bash
# ローカルにコピーする
git clone https://github.com/Megumin32/conduit
# ディレクトリを移動する
cd conduit
# データベースの準備（マイグレーション）
rails db:migrate
# Railsサーバの起動
rails server
```
- ブラウザを起動して，`http://localhost:3000/`にアクセスする．
- 記事の作成 
  - `Create a new article` をクリック
  - `content` はマークダウン記法で記述
  - `tags` はカンマ区切りで入力
- 記事の詳細表示・修正・削除が可能．
- ログイン・サインアップはページ表示のみ．
  

## 構成
### モデル
#### Articlesテーブル  
- `title` : string
- `description` : text
- `content` : text
- `tags` : string

マークダウン形式で入力されたcontentをHTMLに変換するメソッドを次のように定義した．
```ruby
def content_as_html
    Kramdown::Document.new(content).to_html
end
```

### ルーター
``` ruby
Rails.application.routes.draw do
  root 'articles#index' # GET: `/`　=> articleコントローラのindexアクションに対応
  resources :articles #RESTfulな対応
  get '/login', to: 'sessions#login' # GET: `/login` => sessionsコントローラのloginアクションに対応
  get '/register', to: 'registrations#register' # GET: `/registrations` => registrationsコントローラのregisterアクションに対応
end
```

### コントローラー
- `articles_controller` => 記事のCRUD処理を担当
  - アクション： `index` `show` `new` `create` `edit` `update` `destroy`
- `registrations_controller` => サインアップを担当（現状ページ表示だけ）
  - アクション： `register`
- `sessions_controller` => ログインを担当（現状ページ表示だけ）
  - アクション： `login`

### ビュー
-  `index.html.erb` => `/` => ホームページ
-  `new.html.erb` => `/articles/new` => 記事の新規作成ページ
-  `show.html.erb` => `/articles/:id` => 記事の詳細ページ
-  `edit.html.erb` => `/articles/:id/edit` => 記事の編集ページ
-  `register.html.erb` => `/register` => サインアップページ（機能未実装）
-  `login.html.erb` => `/login` => ログインページ（機能未実装）