class MatomesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end

  def maincoin
    @articles = Article.where(category_id: 1).page(params[:page]).per(10)
  end

  def altcoin
    @articles = Article.where(category_id: 2).page(params[:page]).per(10)
  end
end
