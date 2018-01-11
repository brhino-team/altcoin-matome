class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def article_params
    params.require(:article).permit(:body, :title, :thum)
  end
end
