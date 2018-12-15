class ArticlesController < ApplicationController
  def show
    @user = current_user
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

  def new
    @user = current_user
    @article = Article.new
  end

  def create
    @user = current_user
    @category = params[:category_id]
    id = Category.all_category.index(@category).to_i + 1
    @article = Article.create!(user_id: @user.id, category_id: id, title: params[:article][:title], description: params[:article][:description], size: params[:article][:size], image: params[:article][:image])
    puts params[:category_id]

    if @article.save
        redirect_to @article, alert: "Article created successfully."
    else
        redirect_to new_article_path, alert: "Error creating article."
    end
  end
  def destroy
  @article = Article.find(params[:id])
  Exchange.where(applicant_article_id: params[:id]).delete_all
  Exchange.where(owner_article_id: params[:id]).delete_all
  @article.likes.delete_all
  @article.destroy
  respond_to do |format|
    format.html { redirect_to request.referrer, notice: "Cet article, ainsi que ses likes, ont été supprimés" }
  end
end

  def article_params
    params.require(:article).permit(:title, :description, :size, :image, params[:category_id])
  end
end
