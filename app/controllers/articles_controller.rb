class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @category = Category.all
    @user = User.all
    @exchange = Exchange.all
    category = @category 
    article = @article 
    user = @user
    @suggestions = @article.category.articles 
  end

  def index
    @article = Article.all
    @user = User.all
    @category = Category.all
  end
end
