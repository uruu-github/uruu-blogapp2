class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    #set_article
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存できたよ'
    else
      puts @article.errors.full_messages # ここでエラーメッセージを出力
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    #単なるArticleにしてしまうと、自分以外の記事を編集できてしまうので、ログインしているユーザーだけにする。
    @article = current_user.articles.find(params[:id])
  end

  def update
    if @article = current_user.articles.find(params[:id])
	    redirect_to article_path(@article), notice: '更新できました'
	  else
      flash.now[:error] = '更新できませんでした'
		  render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました。'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
