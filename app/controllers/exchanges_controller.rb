class ExchangesController < ApplicationController
  before_action :authenticate_user!
  def index
    @asked_exchange = Exchange.where(applicant_user_id: current_user.id)
    @my_exchange = Exchange.where(owner_user_id: current_user.id)
    @article = Article.all
    @user = User.all
  end

  def create
    exchanges = Exchange.all
    article_id = params[:article_id]
    owner_id = params[:owner_id]
    trade_exist = exchanges.find_by(owner_user_id: owner_id, applicant_user_id: Article.find(article_id).user_id)
    if trade_exist.blank?
      puts "AAAAAAAAAAA"
      new = Exchange.new(applicant_user_id: current_user.id, owner_user_id: owner_id, owner_article_id: article_id)
      new.save
    else
      trade_exist.update(applicant_article_id: article_id)
    end
    redirect_to request.referer
  end
end
