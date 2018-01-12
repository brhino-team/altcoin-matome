class MatomesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @articles = Article.where(category_id: params[:id]).page(params[:page]).per(10)
  end

end
