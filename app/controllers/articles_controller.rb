class ArticlesController < ApplicationController
	#before_action :authenticate_user!  this line is for login before post
 def index
 	
    @articles = Article.all
    @categories = Category.all
  end
  def new
  	@article = Article.new
  end

def create
	@articles = Article.all
	Article.create!( description: params["article"]["description"], size:params["article"]["size"], image: params["article"]["file"])
	redirect_to articles_url

end

  def show
    @articles = Article.find(params[:id])
    @random_articles = Article.all.sample(3)
  end

  
  private   #test sur les params articles et category

  def articles_params
    params.require(:article).permit(:description, :size, :image)
  end

  #def category_params
    #params.require(:Category)
  #end

end
 
