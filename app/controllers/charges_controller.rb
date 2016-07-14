class ChargesController < ApplicationController

  def new
    @order = UserOrder.find(params[:user_order])
  end

  def create
    # Amount in cents
    @amount = 500 
    begin
      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
        )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
      session[:product_id] = []
      session[:coupon_id] = []
      session[:order_id] = []
  end
end