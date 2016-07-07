class OrdersController < ApplicationController
  before_filter :set_cart_quantity_price
  
  def index
    @user_order = UserOrder.where(user_id:current_user.id).first    
    @order_details = @user_order.order.order_details
  end

  def show
    @order = Order.find(params[:id])
    @user_order = UserOrder.where(order_id: params[:id]).first
  end

  def new
    @order = Order.new
  end

  def create
    if session[:order_id].present?

      @order = Order.find(session[:order_id])
      @cart_products.each do |k,v|
        @order_detail = OrderDetail.find_or_initialize_by(product:k,order:@order)
          @order_detail.quantity = v[:quantity]
          @order_detail.amount = v[:total_price]
          @order_detail.save
      end
      

      @user_order = UserOrder.find_by(order:@order,user:current_user)
      if @user_order
        @billing_address = Address.find(params[:billingaddress])
        @shipping_address = Address.find(params[:shippingaddress])
        @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil    
        @user_order.billing_address = @billing_address
        @user_order.shipping_address = @shipping_address
        @user_order.total_amount = @total
        @user_order.coupon_id = @coupon_code
        @user_order.save
      # else
      #   @billing_address = Address.find(params[:billingaddress])
      #   @shipping_address = Address.find(params[:shippingaddress])
      #   @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil    

      #   @user_order = UserOrder.create(order:@order, billing_address:@billing_address, shipping_address:@shipping_address, user:current_user, total_amount:@total, coupon_id:@coupon_code)
      end


      if @coupon_code
        @used_coupon = UsedCoupon.find_by(user_order_id:@user_order.id)
        @used_coupon.coupon_id = @coupon_code
        @used_coupon.save
      # else
      #   @used_coupon = UsedCoupon.create(user:current_user,coupon_id:@coupon_code,user_order_id:@user_order.id)
      end

    else

      @order = Order.create
      
      @cart_products.each do |k,v|
      @order_detail = OrderDetail.create(quantity:v[:quantity], amount:v[:total_price], product:k, order:@order)
      end

      @billing_address = Address.find(params[:billingaddress])
      @shipping_address = Address.find(params[:shippingaddress])
      @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil    

      @user_order = UserOrder.create(order:@order, billing_address:@billing_address, shipping_address:@shipping_address, user:current_user, total_amount:@total, coupon_id:@coupon_code)

      session[:order_id] = @order.id
      

      if @coupon_code
        @used_coupon = UsedCoupon.create(user:current_user,coupon_id:@coupon_code,user_order_id:@user_order.id)
      end
    end  

    redirect_to order_path(@order)
  end

end