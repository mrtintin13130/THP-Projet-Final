class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @category = Category.all
    if user_signed_in?
      if @user.id == current_user.id
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end
    @users = User.all
    @exchange = Exchange.all
    category = @category 
    article = @article 
    user = @user
    @suggestions = @article.category.articles 
  end

  def index
    @article = Article.all
    @user = current_user
    if user_signed_in?
      if @user.id == current_user.id
        @user = current_user
      else
        @user = User.find(params[:id])
      end
      if @user != nil && @user.last_name != nil && @user.first_name != nil
        @user_names = @user.last_name.capitalize + " " + @user.first_name.capitalize
      end
    end
    @category = Category.all
  end
end
