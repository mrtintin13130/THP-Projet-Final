class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @category = Category.all
    @user = User.all
  end

  def index
    @article = Article.all
    @user = User.all
    @category = Category.all
  end
end
