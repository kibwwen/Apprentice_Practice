class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    articles = Article.all
    render json: { status: 'SUCCESS', data: articles }
  end

  def show
    render json: { status: 'SUCCESS', data: @article}
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: {status: 'success', data: article}
    else
      render json: {status: 'ERROR', data: article.errors}
    end
  end

  def update
    @article.update(article_params)
    render json: {status: 'SUCCESS', date: @article}
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find_by_slug(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
