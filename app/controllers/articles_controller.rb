class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @category = Category.all
    @user = User.all
  end
end
