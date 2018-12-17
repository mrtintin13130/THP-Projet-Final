class UsersController < ApplicationController
  before_action :set_user
  before_action :set_username

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      if @user.id == current_user.id
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end
    @mes_likes = Like.where(user_id: current_user.id)
    @exchanges = Exchange.all
    @user_exchanges = @exchanges.where(applicant_user_id: @user.id).where(status: true)
    @my_articles = []
    @his_articles = []
    @user_exchanges.each do |exchange|
      @his_articles << Article.find(exchange.owner_article_id)
      @my_articles << Article.find(exchange.applicant_article_id)
    end
    @exchange = Hash[@his_articles.map.zip(@my_articles)]
    @followers = Favorite.where(favorite_user_id: @user.id).count
  end


  def index
    if user_signed_in?
      if @user.id == current_user.id
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end
    @users = User.all
    @article = Article.all
    @favorite = Favorite.new
  end

  def verification_number
    @phoneuser = User.find(current_user.id).phone
    if @user.phone_verified == false
      User.sms_send(@user, @user.phone)
    end
  end

  def new_verification_number
    if params[:new] != nil
      @user.phone = params[:new]
      @user.save
    elsif params[:text] != nil
      if params[:text].to_i == @user.code_confirm
        @user.phone_verified = true
        @user.save
      end
    end
    respond_to do |format|
      format.html { redirect_to request.referrer}
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.likes.delete_all
    @user.articles.delete_all
    @user.messages.delete_all
    @user.conversations.delete_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Cet utilisateur, ainsi que ses articles et messages, ont été supprimés" }
    end
  end


  private


  def set_user
    @user = current_user
  end

end
