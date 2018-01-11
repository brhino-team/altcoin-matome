class MatomesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end
end
