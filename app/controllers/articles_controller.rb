class ArticlesController < ApplicationController
 def index
    @articles = Article.all
    @categories = Category.all
  end

  def show
    @articles = Article.find(params[:id])
    @random_articles = Article.all.sample(3)
  end

 end
