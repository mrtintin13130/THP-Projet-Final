class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @category = Category.all
    @user = User.all
    @exchange = Exchange.all
  end

  def index
    @article = Article.all
    @user = User.all
    @category = Category.all
  end

  def new
    @article = Article.new
  end

  def create
    @user = current_user
    @category = params[:category_id]
    id = Category.all_category.index(@category).to_i + 1
    puts id
    @article = Article.create!(user_id: @user.id, category_id: id, title: params[:article][:title], description: params[:article][:description], size: params[:article][:size], image: params[:article][:image])
    puts params[:category_id]

    if @article.save
        redirect_to @article, alert: "Article created successfully."
    else
        redirect_to new_article_path, alert: "Error creating article."
    end
  end
  def article_params
    params.require(:article).permit(:title, :description, :size, :image, params[:category_id])
  end
end
