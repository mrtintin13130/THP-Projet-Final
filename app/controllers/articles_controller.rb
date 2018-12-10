class ArticlesController < ApplicationController

	#before_action :authenticate_user!  #this line is for login before post
 def index
 	
    @articles = Article.all
    @categories = Category.all
    @user = User.all
  end
  def new
  	@article = Article.new
  end

def create
	#@articles = Article.all
	#@article = Article.create!( description: params["article"]["description"], size:params["article"]["size"], image: params["article"]["file"])

@article = Article.new(articles_params)
@article.user = current_user
 
    if @article.save
      redirect_to @article, notice: 'Votre article a bien été ajouté.'
    else
      render :new
    end
  

	

end

  def show
  	@user = User.all
  	@category = Category.all
    @article =  Article.find(params[:id])

    @random_articles = Article.all.sample(3)

    @exchange = Exchange.all

  end

  
  private   #test sur les params articles et category

  def articles_params
    params.require(:article).permit(:description, :size, :image, :title, category_attributes:[:name])
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

