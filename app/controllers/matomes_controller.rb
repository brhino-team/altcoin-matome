class MatomesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end
end
