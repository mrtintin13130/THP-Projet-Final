class ArticlesController < ApplicationController
	before_action :authenticate_user!
 def index
 	
    @articles = Article.all
    @categories = Category.all
  end

def create
	Article.create!( description: params["article"]["description"], size:params["article"]["size"], status:params["article"]["status"], image: params["article"]["file"])
redirect_to articles_url
end

  def show
    @articles = Article.find(params[:id])
    @random_articles = Article.all.sample(3)
  end

  
  #private   #test sur les params articles et category

  #def articles_params
    #params.permit(:description, :size, :status, :image)
  #end

  #def category_params
    #params.require(:Category)
  #end

end
 
