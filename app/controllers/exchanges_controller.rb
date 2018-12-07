class ExchangesController < ApplicationController
  before_action :authenticate_user!
  def index
    @i_asked = Exchange.where(applicant_user_id: current_user.id)
    @they_asked = Exchange.where(owner_user_id: current_user.id)
    @exchange = Exchange.all
    @article = Article.all
    @user = User.all
  end

  def create
    # exchanges = Exchange.all
    article_id = params[:article_id]
    owner_id = params[:owner_id]
    trade_exist = Exchange.where(owner_user_id: owner_id).where(applicant_user_id: current_user.id).where(owner_article_id: article_id)

    puts current_user.id
    puts article_id
    puts owner_id
    puts trade_exist

    if trade_exist.blank?
      new = Exchange.new(applicant_user_id: current_user.id, owner_user_id: owner_id, owner_article_id: article_id)
      new.save
    else
      trade_exist.update(applicant_article_id: article_id)
    end
    redirect_to request.referer
  end

  def show

  end
end
