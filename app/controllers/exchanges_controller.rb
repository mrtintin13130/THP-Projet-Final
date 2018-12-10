class ExchangesController < ApplicationController
  before_action :authenticate_user!
  def index
    @i_asked = Exchange.where(applicant_user_id: current_user.id).where(status: nil)
    @they_asked = Exchange.where(owner_user_id: current_user.id).where(status: nil)
    @user = User.all
    @article = Article.all
  end

  def new
    @exchange = Exchange.new
    @article = Article.find(params[:article_id])
    @user = User.find(params[:owner_id])
    @options = Article.where(user_id: current_user.id)
  end

  def create
    puts current_user.id
    puts params[:exchange][:owner_id]
    puts params[:article_id]
    puts params[:exchange][:owner_article_id]

    @exchange = Exchange.create(
      applicant_user_id: current_user.id,
      owner_user_id: params[:exchange][:owner_id],
      applicant_article_id: params[:article_id],
      owner_article_id: params[:exchange][:owner_article_id])
    # redirect_to request.referer
  end

  def show

  end
end
