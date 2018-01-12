class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy_confirmation destroy)
  before_action :redirect_root, only: %i(edit destroy_confirmation)

  def new
    if user_signed_in?
      @article = Article.new
    else
      redirect_to root_path
    end
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
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy_confirmation
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def article_params
    params.require(:article).permit(:body, :title, :thum, :user_name, :category_id)
  end
end
