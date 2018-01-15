class MatomesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").includes(:category).page(params[:page]).per(10)
    @article_first = Article.order("created_at DESC").first
    @article_main = @articles[1, 2]
  end

  def show
    @articles = Article.where(category_id: params[:id]).includes(:category).page(params[:page]).per(10)
    @articles_second = Article.order("created_at DESC")
    @article_first = Article.order("created_at DESC").first
    @article_main = @articles_second[1, 2]
  end

end
