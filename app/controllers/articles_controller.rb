class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def create
    @new_article = Article.new(article_params)
    redirect_to article_path(@new_article) if @new_article.save
  end

  def new
    @new_article = Article.new
  end

  def edit; end

  def show; end

  def update
    redirect_to article_path(@article) if @article.update(article_params)
  end

  def destroy
    redirect_to articles_path if @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
