class ArticlesController < ApplicationController
	before_action :authenticate_user!
 def index
 	
    @articles = Article.all
    @categories = Category.all
  end
def create
	@article = Article.new(articles_params)
end

  def show
    @articles = Article.find(params[:id])
    @random_articles = Article.all.sample(3)
  end

 end
