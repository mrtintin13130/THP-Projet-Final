class ChargesController < ApplicationController
    def new
        @amount = params[:amount]
    end

    def create
        @amount = params[:amount]
        customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source  => params[:stripeToken]
            )
        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @amount.to_i * 100,
            :description => 'Rails Stripe customer',
            :currency    => 'usd'
            )
        rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end
end

