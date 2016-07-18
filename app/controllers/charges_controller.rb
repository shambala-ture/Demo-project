class ChargesController < ApplicationController

  def new
    @order = Order.find(params[:user_order])
  end

  def create
    @order = Order.find(params[:user_order])
    # Amount in cents
    @amount = @order.total_amount.to_i
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
      @order.update(:status => "completed")
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end
      session[:product_id] = []
      session[:coupon_id] = []
      session[:order_id] = []
  end
end