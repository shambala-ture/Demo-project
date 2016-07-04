class OrdersController < ApplicationController
  before_filter :set_cart_quantity_price
  def new
    @order = Order.new
   

  end

  def create
    @order = Order.create
      @cart_products.each do |k,v|
      @order_detail = OrderDetail.create(quantity:v[:quantity],amount:v[:total_price],product:k,order:@order)
    end
    redirect_to root_path
  end

end