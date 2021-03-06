class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)
  before_action :redirect_root, only: %i(edit)
  before_action :tag_list, only: %i(create update)
  before_action :set_tags, only: %i(show search)
  before_action :set_articles, only: %i(show search)

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
       @article.save_tags(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @articles = Article.order("created_at DESC")
  end

  def edit
    @tag_list = @article.tags.pluck(:name).join(",")
  end

  def update
    if @article.update(article_params)
       @article.save_tags(tag_list)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def search
    @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def tag_list
    tag_list = params[:tag_list].split(",")
  end

  def set_articles
    articles_second = Article.order("created_at DESC")
    @article_first = articles_second.first
    @article_main = articles_second[1, 2]
  end

  def set_tags
      @tags = Tag.order("created_at DESC").limit(20)
  end

  def article_params
    params.require(:article).permit(:body, :title, :thum, :user_name, :category_id)
  end
end
