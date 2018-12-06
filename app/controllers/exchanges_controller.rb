class ExchangesController < ApplicationController
  before_action :authenticate_user!
  def index
    @asked_exchange = Exchange.where(applicant_user_id: current_user.id)
    @my_exchange = Exchange.where(owner_user_id: current_user.id)
    @article = Article.all
    @user = User.all
    puts @asked_exchange
  end
end
