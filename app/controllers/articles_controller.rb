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
	#@articles = Article.all
	#@article = Article.create!( description: params["article"]["description"], size:params["article"]["size"], image: params["article"]["file"])
	
@article = Article.new(articles_params)
 
    if @article.save
      redirect_to @article, notice: 'Upload was successfully created.'
    else
      render :new
    end
  

	

end

  def show
    @article = Article.find(params[:id])
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
 

  #def show
    #@article = Article.find(params[:id])
    #@category = Category.all
    #@user = User.all
  #end

  #def index
    #@article = Article.all
    #@user = User.all
    #@category = Category.all
  #end
#end

