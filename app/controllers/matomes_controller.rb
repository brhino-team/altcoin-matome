class MatomesController < ApplicationController
  before_action :set_tags, only: %i(index show tag)
  before_action :set_articles, only: %i(index show tag)

  def index
    @articles = Article.order("created_at DESC").includes(:category).page(params[:page]).per(10)
  end

  def show
    @articles = Article.where(category_id: params[:id]).includes(:category).page(params[:page]).per(10)
  end

  def tag
    @articles= Article.from_tag(params[:id]).page(params[:page])
  end

  private
  def set_articles
    articles_second = Article.order("created_at DESC")
    @article_first = articles_second.first
    @article_main = articles_second[1, 2]
  end

  def set_tags
    @tags = Tag.order("created_at DESC").limit(20)
  end
end
