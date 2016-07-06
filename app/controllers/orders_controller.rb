class OrdersController < ApplicationController
  before_filter :set_cart_quantity_price
  def index
    @user_order = UserOrder.where(user_id:current_user.id).first
    @order_details = @user_order.order.order_details
  end
  def new
    @order = Order.new
  end

  def create
    @order = Order.create

    @cart_products.each do |k,v|
      @order_detail = OrderDetail.create(quantity:v[:quantity], amount:v[:total_price], product:k, order:@order)
    end
    @billing_address = Address.find(params[:billingaddress])
    @shipping_address = Address.find(params[:shippingaddress])
    @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil
    @user_order = UserOrder.create(order:@order, billing_address:@billing_address, shipping_address:@shipping_address, user:current_user, total_amount:@total, coupon_id:@coupon_code)
    if @coupon_code
      @used_coupon = UsedCoupon.create(user:current_user,coupon_id:@coupon_code,user_order_id:@user_order.id)
    end
    redirect_to orders_path
  end
end