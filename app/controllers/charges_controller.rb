class ChargesController < ApplicationController
  before_action :authenticate_user!
  def new
    #@amount = params[:amount]
    if current_user.premium_user == true
      redirect_to user_path(current_user)
    end
    @user = current_user
  end

  def create

    @user = current_user
    # Amount in cents
    @amount = 1000

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
    user = User.find(current_user.id)
    user.update(premium_user: true)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
