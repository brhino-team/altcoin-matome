class MatomesController < ApplicationController
  before_action :set_tags, only: %i(index show tag)

  def index
    @articles = Article.order("created_at DESC").includes(:category).page(params[:page]).per(10)
    @article_first = Article.order("created_at DESC").first
    @article_main = @articles[1, 2]
  end

  def show
    @articles = Article.where(category_id: params[:id]).includes(:category).page(params[:page]).per(10)
    articles_second = Article.order("created_at DESC")
    @article_first = Article.order("created_at DESC").first
    @article_main = articles_second[1, 2]
  end

  def tag
    @articles= Article.from_tag(params[:id]).page(params[:page])
    articles_second = Article.order("created_at DESC")
    @article_first = Article.order("created_at DESC").first
    @article_main = articles_second[1, 2]
  end

  private
  def set_tags
    @tags = Tag.order("created_at DESC")
  end
end
