class ArticlesController < ApplicationController
  # 一覧ページ（home）
  def index
    @articles = Article.all
  end

  # 記事の詳細ページ（show）
  def show
    @article = Article.find(params[:id])
  end

  # 記事の新規作成ページ（create）
  def new
    @article = Article.new
  end

  # 記事の作成処理（create）
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article  # 成功したら新規作成した記事のページにリダイレクト
    else
      render :new  # 失敗したら新規作成ページに戻る
    end
  end

  # 記事の編集ページ（edit）
  def edit
    @article = Article.find(params[:id])
  end

  # 記事の更新処理（update）
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article  # 更新後、記事詳細ページにリダイレクト
    else
      render :edit  # 失敗したら編集ページに戻る
    end
  end

  # 記事の削除処理（destroy）
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path  # 削除後、ホームページにリダイレクト
  end

  private

  # 記事のパラメータを許可
  def article_params
    params.require(:article).permit(:title, :description, :content, :tags)
  end
end
